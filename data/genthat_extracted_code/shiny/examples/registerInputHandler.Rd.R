library(shiny)


### Name: registerInputHandler
### Title: Register an Input Handler
### Aliases: registerInputHandler

### ** Examples

## Not run: 
##D # Register an input handler which rounds a input number to the nearest integer
##D registerInputHandler("mypackage.validint", function(x, shinysession, name) {
##D   if (is.null(x)) return(NA)
##D   round(x)
##D })
##D 
##D ## On the Javascript side, the associated input binding must have a corresponding getType method:
##D getType: function(el) {
##D   return "mypackage.validint";
##D }
##D 
## End(Not run)



