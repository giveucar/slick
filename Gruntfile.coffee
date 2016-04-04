module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    compass:
      build:
        options:
          config: 'slick/config.rb'
          trace: true

    autoprefixer:
      build:
        options:
          browsers: ['last 2 versions']
        files:
          'slick/slick-theme.css': ['slick/slick-theme.css']
          'slick/slick.css': ['slick/slick.css']

    cssmin:
      minify:
        expand: true
        cwd: 'slick/'
        src: ['*.css', '!*.min.css']
        dest: 'slick/'
        ext: '.min.css'

    uglify:
      options:
        compress: true
      minify:
        options:
          compress: true
        files:
          'slick/slick.min.js': ['slick/slick.js']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-autoprefixer'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'


  grunt.registerTask 'default',           ['build']
  grunt.registerTask 'build',             ['compass', 'autoprefixer', 'cssmin', 'uglify']

