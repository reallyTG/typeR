library(deseasonalize)


### Name: summary.deseasonalize
### Title: Summary Method for "deseasonalize" Object
### Aliases: summary.deseasonalize
### Keywords: ts

### ** Examples

#Example 1: to save time only try 2 components
out <- ds(nottem, Fm=2, Fs=2, type="monthly")
summary(out)

#Example 2
## Not run: 
##D out <- ds(nottem, Fm=6, Fs=6, type="monthly")
##D summary(out)
## End(Not run)



