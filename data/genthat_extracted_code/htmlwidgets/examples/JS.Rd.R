library(htmlwidgets)


### Name: JS
### Title: Mark character strings as literal JavaScript code
### Aliases: JS

### ** Examples

library(htmlwidgets)
JS('1 + 1')
list(x = JS('function(foo) {return foo;}'), y = 1:10)
JS('function(x) {', 'return x + 1;', '}')



