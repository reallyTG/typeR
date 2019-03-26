library(extracat)


### Name: ahist
### Title: Histogram using active bins
### Aliases: ahist

### ** Examples

ahist(rnorm(100))
ahist(rnorm(1000))
ahist(rnorm(10000))


ahist(rexp(100))
ahist(rexp(1000))
ahist(rexp(10000))


## Not run: 
##D ahist(rcauchy(1000))
##D ahist(rcauchy(1000), ival = 0.95)
##D 
##D x <- c(rnorm(400),rnorm(200, mean=6))
##D ahist(x)
##D 
##D x <- c(rnorm(400),rnorm(200, mean=16))
##D ahist(x)
##D 
##D 
##D x <- c(rnorm(400),rnorm(200, mean=32))
##D ahist(x)
## End(Not run)



