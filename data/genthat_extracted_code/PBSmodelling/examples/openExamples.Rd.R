library(PBSmodelling)


### Name: openExamples
### Title: Open Example Files from a Package
### Aliases: openExamples
### Keywords: file

### ** Examples

## Not run: 
##D # Copies fib.c and fib.r from the examples directory in 
##D # PBSmodelling to the temporary working directory, and opens these files.
##D local(envir=.PBSmodEnv,expr={
##D   cwd = getwd(); setwd(tempdir())
##D   openExamples("PBSmodelling", c("fib"), c(".r", ".c"))
##D   setwd(cwd)
##D })
## End(Not run)



