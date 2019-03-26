library(Directional)


### Name: MLE of the spherical projected normal distribution
### Title: MLE of the spherical projected normal distribution
### Aliases: iag.mle
### Keywords: Maximum likelihood estimation spherical data projected normal
###   distribution

### ** Examples

x <- as.matrix(iris[,1:3])
x <- x / sqrt( rowSums(x^2) )
iag.mle(x)



