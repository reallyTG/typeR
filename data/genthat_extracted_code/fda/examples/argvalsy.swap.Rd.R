library(fda)


### Name: argvalsy.swap
### Title: Swap argvals with y if the latter is simpler.
### Aliases: argvalsy.swap
### Keywords: smooth

### ** Examples

##
## one argument:  y
##
argvalsy.swap(1:5)
# warning ... 

##
## (argvals, y), same dimensions:  retain order 
##
argy1 <- argvalsy.swap(seq(0, 1, .2), 1:6)
argy1a <- argvalsy.swap(1:6, seq(0, 1, .2))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(argy1[[1]], argy1a[[2]]) &&
all.equal(argy1[[2]], argy1a[[1]])
# TRUE;  basisobj different 
## Don't show: 
)
## End(Don't show)

# lengths do not match 
## Not run: 
##D argvalsy.swap(1:4, 1:5)
## End(Not run) 

##
## two numeric arguments, different dimensions:  put simplest first 
##
argy2 <- argvalsy.swap(seq(0, 1, .2), matrix(1:12, 6))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(argy2,
argvalsy.swap(matrix(1:12, 6), seq(0, 1, .2)) )
# TRUE with a warning ... 
## Don't show: 
)
## End(Don't show)

## Not run: 
##D argvalsy.swap(seq(0, 1, .2), matrix(1:12, 2))
##D # ERROR:  first dimension does not match 
## End(Not run)

##
## one numeric, one basisobj
##
argy3 <- argvalsy.swap(1:6, b=4)
# warning:  argvals assumed seq(0, 1, .2) 

argy3. <- argvalsy.swap(1:6, b=create.bspline.basis(breaks=0:1))
# warning:  argvals assumed seq(0, 1, .2) 

argy3.6 <- argvalsy.swap(seq(0, 1, .2), b=create.bspline.basis(breaks=1:3))
# warning:  argvals assumed seq(1, 3 length=6)

##
## two numeric, one basisobj:  first matches basisobj
##
#  OK 
argy3a <- argvalsy.swap(1:6, seq(0, 1, .2),
              create.bspline.basis(breaks=c(1, 4, 8))) 

#  Swap (argvals, y) 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(argy3a,
argvalsy.swap(seq(0, 1, .2), 1:6, 
              create.bspline.basis(breaks=c(1, 4, 8))) )
# TRUE with a warning 
## Don't show: 
)
## End(Don't show)


## Not run: 
##D # neither match basisobj:  error  
##D argvalsy.swap(seq(0, 1, .2), 1:6, 
##D               create.bspline.basis(breaks=1:3) ) 
## End(Not run)




