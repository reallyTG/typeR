library(reshape)


### Name: sparseby
### Title: Apply a Function to a Data Frame split by levels of indices
### Aliases: sparseby
### Keywords: iteration category

### ** Examples

x <- data.frame(index=c(rep(1,4),rep(2,3)),value=c(1:7))
x
sparseby(x,x$index,nrow)

# The version below works entirely in matrices
x <- as.matrix(x)
sparseby(x,list(group = x[,"index"]), function(subset) c(mean=mean(subset[,2])))



