library(PBSmodelling)


### Name: setWinVal
### Title: Update Widget Values
### Aliases: setWinVal
### Keywords: methods

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   winDesc <- c("vector length=3 name=vec",
##D     "matrix nrow=2 ncol=2 name=mat", "slideplus name=foo");
##D   createWin(winDesc, astext=TRUE)
##D   setWinVal(list(vec=1:3, "mat[1,1]"=123, foo.max=1.5, foo.min=0.25, foo=0.7))
##D })
## End(Not run)



