library(inline)


### Name: utilities
### Title: printing, reading and writing CFunc objects
### Aliases: utilities writeDynLib readDynLib print,CFunc-method
###   print,CFuncList-method code code-methods code,character-method
###   code,CFunc-method code,CFuncList-method
### Keywords: file

### ** Examples


x <- as.numeric(1:10)
n <- as.integer(10)

code <- "
      integer i
      do 1 i=1, n(1)
    1 x(i) = x(i)**3
"
cubefn <- cfunction(signature(n="integer", x="numeric"), code, convention=".Fortran")
code(cubefn)

cubefn(n, x)$x

## Not run: 
##D  fname <- tempfile()
##D  writeDynLib(cubefn, file = fname)
##D  # load and assign different name to object
##D  cfn <- readDynLib(fname)
##D  print(cfn)
##D  cfn(2, 1:2)
## End(Not run)




