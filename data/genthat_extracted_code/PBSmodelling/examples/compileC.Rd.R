library(PBSmodelling)


### Name: compileC
### Title: Compile a C File into a Shared Library Object
### Aliases: compileC
### Keywords: programming interface

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   cwd = getwd()
##D   edir <- system.file("examples", package = "PBSmodelling" )
##D   file.copy(paste(edir,"fib.c",sep="/"), tempdir(), overwrite=TRUE)
##D   setwd(tempdir())
##D   compileC("fib.c", lib="myLib", options="myObj.o", logWindow=FALSE)
##D   print(list.files())
##D   setwd(cwd)
##D })
## End(Not run)



