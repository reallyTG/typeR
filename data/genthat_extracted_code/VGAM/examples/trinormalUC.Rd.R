library(VGAM)


### Name: Trinorm
### Title: Trivariate Normal Distribution Density and Random Variates
### Aliases: Trinorm dtrinorm rtrinorm
### Keywords: distribution

### ** Examples

## Not run: 
##D nn <- 1000
##D tdata <- data.frame(x2 = sort(runif(nn)))
##D tdata <- transform(tdata, mean1 = 1 + 2 * x2,
##D                    mean2 = 3 + 1 * x2, mean3 = 4,
##D                    var1 = exp( 1), var2 = exp( 1), var3 = exp( 1),
##D                    rho12 = rhobit( 1, inverse = TRUE),
##D                    rho23 = rhobit( 1, inverse = TRUE),
##D                    rho13 = rhobit(-1, inverse = TRUE))
##D ymat <- with(tdata, rtrinorm(nn, mean1, mean2, mean3,
##D                              var1, var2, var3,
##D                              sqrt(var1)*sqrt(var1)*rho12,
##D                              sqrt(var2)*sqrt(var3)*rho23,
##D                              sqrt(var1)*sqrt(var3)*rho13))
##D pairs(ymat, col = "blue")
## End(Not run)



