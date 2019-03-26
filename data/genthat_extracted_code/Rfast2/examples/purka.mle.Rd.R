library(Rfast2)


### Name: MLE of the Purkayashta distribution
### Title: MLE of the Purkayashta distribution
### Aliases: purka.mle

### ** Examples

x <- cbind( rnorm(100,1,1), rnorm(100, 2, 1) )
x <- x / sqrt(rowSums(x^2))
purka.mle(x)



