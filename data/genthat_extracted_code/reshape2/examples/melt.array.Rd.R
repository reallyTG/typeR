library(reshape2)


### Name: melt.array
### Title: Melt an array.
### Aliases: melt.array melt.table melt.matrix
### Keywords: manip

### ** Examples

a <- array(c(1:23, NA), c(2,3,4))
melt(a)
melt(a, na.rm = TRUE)
melt(a, varnames=c("X","Y","Z"))
dimnames(a) <- lapply(dim(a), function(x) LETTERS[1:x])
melt(a)
melt(a, varnames=c("X","Y","Z"))
dimnames(a)[1] <- list(NULL)
melt(a)



