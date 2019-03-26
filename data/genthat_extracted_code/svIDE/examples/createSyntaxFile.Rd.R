library(svIDE)


### Name: createSyntaxFile
### Title: Create a syntax definition or a calltip file for R language
### Aliases: createSyntaxFile createCallTipFile
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Create a syntax highlighting file for all currently loaded R packages
##D createSyntaxFile("Rtemp.svl")
##D ## Show and delete it
##D file.show("Rtemp.svl", delete.file = TRUE)
##D 
##D ## Create a calltips file for all currently loaded R packages
##D createCallTipFile("Rtemp.ctip", return.location = TRUE)
##D ## Show and delete it
##D file.show("Rtemp.ctip", delete.file = TRUE)
##D 
##D ## You can also customize the calltip file and select the package
##D ## Here we include only functions from base package (the last item
##D ## in the search path)
##D createCallTipFile("Rtemp2.ctip", pos = length(search()),
##D     field.sep = ";", only.args = TRUE)
##D ## Show and delete it
##D file.show("Rtemp2.ctip", delete.file = TRUE)
## End(Not run)



