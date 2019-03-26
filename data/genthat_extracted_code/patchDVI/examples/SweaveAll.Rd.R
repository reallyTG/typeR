library(patchDVI)


### Name: SweaveAll
### Title: Apply Sweave to a collection of files.
### Aliases: SweaveAll .SweaveFiles .TexRoot .PostSweaveHook
### Keywords: utilities

### ** Examples

## Not run: 
##D # Run Sweave on a main file, and obtain other files from there.
##D SweaveAll("main.Rnw")
##D 
##D # Run knitr on the same file.
##D SweaveAll("main.Rnw", weave = knitr::knit)
## End(Not run)


