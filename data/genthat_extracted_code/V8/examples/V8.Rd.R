library(V8)


### Name: V8
### Title: Run JavaScript in a V8 context
### Aliases: V8 v8 new_context engine_info

### ** Examples

# Create a new context
ctx <- v8();

# Evaluate some code
ctx$eval("var foo = 123")
ctx$eval("var bar = 456")
ctx$eval("foo+bar")

# Functions and closures
ctx$eval("JSON.stringify({x:Math.random()})")
ctx$eval("(function(x){return x+1;})(123)")

# Objects (via JSON only)
ctx$assign("mydata", mtcars)
ctx$get("mydata")
ctx$get("mydata", simplifyVector = FALSE)

# Assign JavaScript
ctx$assign("foo", JS("function(x){return x*x}"))
ctx$assign("bar", JS("foo(9)"))
ctx$get("bar")

# Validate script without evaluating
ctx$validate("function foo(x){2*x}") #TRUE
ctx$validate("foo = function(x){2*x}") #TRUE
ctx$validate("function(x){2*x}") #FALSE

# Use a JavaScript library
ctx$source(system.file("js/underscore.js", package="V8"))
ctx$call("_.filter", mtcars, JS("function(x){return x.mpg < 15}"))

# Example from underscore manual
ctx$eval("_.templateSettings = {interpolate: /\\{\\{(.+?)\\}\\}/g}")
ctx$eval("var template = _.template('Hello {{ name }}!')")
ctx$call("template", list(name = "Mustache"))

# Call anonymous function
ctx$call("function(x, y){return x * y}", 123, 3)

## Not run: 
##D CoffeeScript
##D ct2 <- v8()
##D ct2$source("http://coffeescript.org/extras/coffee-script.js")
##D jscode <- ct2$call("CoffeeScript.compile", "square = (x) -> x * x", list(bare = TRUE))
##D ct2$eval(jscode)
##D ct2$call("square", 9)
##D 
##D # Interactive console
##D ct3 <- v8()
##D ct3$console()
##D //this is JavaScript
##D var test = [1,2,3]
##D JSON.stringify(test)
##D exit
## End(Not run)




