library(rJava)


### Name: toJava
### Title: Convert R objects to REXP references in Java
### Aliases: toJava
### Keywords: interface

### ** Examples

## Not run: 
##D   .jinit()
##D   # requires JRI and REngine classes
##D   .jengine(TRUE)
##D   f <- function() { cat("Hello!\n"); 1 }
##D   fref <- toJava(f)
##D   # to use this in Java you would use something like:
##D   # public static REXP call(REXPReference fn) throws REngineException, REXPMismatchException {
##D   #	 return fn.getEngine().eval(new REXPLanguage(new RList(new REXP[] { fn })), null, false);
##D   # }
##D   # .jcall("Call","Lorg/rosuda/REngine/REXP;","call", fref)
##D   
## End(Not run)



