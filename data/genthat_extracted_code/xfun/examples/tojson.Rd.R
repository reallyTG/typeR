library(xfun)


### Name: tojson
### Title: A simple JSON serializer
### Aliases: tojson json_vector

### ** Examples

library(xfun)
tojson(NULL)
tojson(1:10)
tojson(TRUE)
tojson(FALSE)
cat(tojson(list(a = 1, b = list(c = 1:3, d = "abc"))))
cat(tojson(list(c("a", "b"), 1:5, TRUE)))

# the class JS_EVAL is originally from htmlwidgets::JS()
JS = function(x) structure(x, class = "JS_EVAL")
cat(tojson(list(a = 1:5, b = JS("function() {return true;}"))))



