library(shiny)


### Name: outputOptions
### Title: Set options for an output object.
### Aliases: outputOptions

### ** Examples

## Not run: 
##D # Get the list of options for all observers within output
##D outputOptions(output)
##D 
##D # Disable suspend for output$myplot
##D outputOptions(output, "myplot", suspendWhenHidden = FALSE)
##D 
##D # Change priority for output$myplot
##D outputOptions(output, "myplot", priority = 10)
##D 
##D # Get the list of options for output$myplot
##D outputOptions(output, "myplot")
## End(Not run)




