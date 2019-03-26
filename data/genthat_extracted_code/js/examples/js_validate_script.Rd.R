library(js)


### Name: js_validate_script
### Title: Validate JavaScript
### Aliases: js_validate_script

### ** Examples

js_validate_script("function foo(x){2*x}") #TRUE
js_validate_script("foo = function(x){2*x}") #TRUE

# Anonymous functions in global scope are invalid
js_validate_script("function(x){2*x}", error = FALSE) #FALSE

# Use ! or () to check anonymous function syntax
js_validate_script("!function(x){2*x}") #TRUE
js_validate_script("(function(x){2*x})") #TRUE



