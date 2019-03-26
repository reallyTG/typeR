library(REPLesentR)


### Name: newPresentation
### Title: Create a new presentation
### Aliases: newPresentation introPresentation

### ** Examples

## Not run: 
##D ## Start with the example:
##D introPresentation() # in presentation mode type 'h'
##D 
##D ## The same presentation but with manual configuration:
##D file <- system.file("Introduction.Rmd", package = "REPLesentR")
##D myPresentation <- newPresentation(
##D   file, width = 80, height = 23, border = "O", padding = 1)
##D myPresentation$start()
## End(Not run)



