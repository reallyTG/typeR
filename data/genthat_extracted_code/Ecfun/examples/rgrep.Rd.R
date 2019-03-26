library(Ecfun)


### Name: rgrep
### Title: Reverse grep
### Aliases: rgrep
### Keywords: aplot

### ** Examples

##
## 1.  return index 
##
dd <- data.frame(a = gl(3,4), b = gl(4,1,12)) # balanced 2-way
mm <- model.matrix(~ a + b, dd)

b. <- rgrep(names(dd), colnames(mm)[5])
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(b., 2)
## Don't show: 
)
## End(Don't show)
##
## 2.  return value 
##
bv <- rgrep(names(dd), colnames(mm)[5], value=TRUE)
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(bv, 'b')
## Don't show: 
)
## End(Don't show)



