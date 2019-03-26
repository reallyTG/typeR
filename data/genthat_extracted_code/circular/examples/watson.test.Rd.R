library(circular)


### Name: watson.test
### Title: Watson's Test
### Aliases: watson.test print.watson.test
### Keywords: htest

### ** Examples

# Generate data from the uniform distribution on the circle.
x <- circular(runif(100, 0, 2*pi))  
watson.test(x)
# Generate data from a von Mises distribution.
x <- rvonmises(n=50, mu=circular(0), kappa=4) 
watson.test(x, alpha=0.05, dist="vonmises")



