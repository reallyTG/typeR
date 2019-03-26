library(cba)


### Name: lmplot
### Title: Plotting Logical Matrices
### Aliases: lmplot
### Keywords: cluster hplot

### ** Examples

###
x <- matrix(sample(c(FALSE, TRUE), 64, rep=TRUE), ncol=8)
lmplot(x)
### use lower resolution
lmplot(x, block.size=2)
### use gray scale
lmplot(x, block.size=2, gray=TRUE)



