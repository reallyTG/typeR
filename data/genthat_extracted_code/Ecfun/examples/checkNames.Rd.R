library(Ecfun)


### Name: checkNames
### Title: Check and return names
### Aliases: checkNames
### Keywords: manip

### ** Examples

##
## 1.  standard operation with no names 
## 
tst1 <- checkNames(1:2)

# check 
tst1. <- make.names(character(2), unique=TRUE)
attr(tst1., 'message') <- paste(
  "1:2:  names = NULL; returning", 
  "make.names(character(length(x))), TRUE)")
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst1, tst1.)
## Don't show: 
)
## End(Don't show)
##
## 2.  avoid=c('\\.0$', '\\.1$')
##
tst2 <-checkNames(1:2, 
    avoid=c('\\.0$', '.2', 
            '\\.1$', '.3') )

# check 
tst2. <-c('X', 'X.3')
attr(tst2., 'message') <- paste(
  "1:2:  names = NULL; returning", 
  "make.names(character(length(x))), TRUE)")
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst2, tst2.)
## Don't show: 
)
## End(Don't show)



