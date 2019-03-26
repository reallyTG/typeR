library(psych)


### Name: harmonic.mean
### Title: Find the harmonic mean of a vector, matrix, or columns of a
###   data.frame
### Aliases: harmonic.mean
### Keywords: multivariate

### ** Examples

x <- seq(1,5)
x2 <- x^2
x2[2] <- NA
y <- x - 1
X <- data.frame(x,x2,y)
harmonic.mean(x)
harmonic.mean(x2)
harmonic.mean(X)
harmonic.mean(X,na.rm=FALSE)
harmonic.mean(X,zero=FALSE)




