library(energy)


### Name: Fast bivariate dcor and dcov
### Title: Fast dCor and dCov for bivariate data only
### Aliases: dcor2d dcov2d

### ** Examples

  ## No test: 
    ## these are equivalent, but 2d is faster for n > 50
    n <- 100
    x <- rnorm(100)
    y <- rnorm(100)
    all.equal(dcov(x, y)^2, dcov2d(x, y), check.attributes = FALSE)
    all.equal(bcdcor(x, y), dcor2d(x, y, "U"), check.attributes = FALSE)
    
## End(No test)



