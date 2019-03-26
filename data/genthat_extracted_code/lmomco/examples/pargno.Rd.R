library(lmomco)


### Name: pargno
### Title: Estimate the Parameters of the Generalized Normal Distribution
### Aliases: pargno
### Keywords: distribution (parameters) Distribution: Generalized Normal

### ** Examples

lmr <- lmoms(rnorm(20))
pargno(lmr)

## Not run: 
##D x <- c(2.4, 2.7, 2.3, 2.5, 2.2, 62.4, 3.8, 3.1)
##D gno <- pargno(lmoms(x)) # triggers warning: Hosking's limit is Tau3=+-0.95 
## End(Not run)



