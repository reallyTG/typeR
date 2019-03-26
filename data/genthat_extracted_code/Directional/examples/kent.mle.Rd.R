library(Directional)


### Name: MLE of the Kent distribution
### Title: MLe of the Kent distribution
### Aliases: kent.mle
### Keywords: Kent distribution maximum likelihood estimation

### ** Examples

x <- rvmf(200, rnorm(3), 15)
kent.mle(x)
vmf(x)
A <- diag( c(-5, 0, 5) )
x <- rfb(200, 15, rnorm(3), A)
kent.mle(x)
vmf(x)



