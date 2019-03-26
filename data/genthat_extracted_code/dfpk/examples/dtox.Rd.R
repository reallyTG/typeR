library(dfpk)


### Name: dtox
### Title: Dose finding method DTOX.
### Aliases: dtox
### Keywords: models

### ** Examples

    ## Not run: 
##D         doses <- c(12.59972,34.65492,44.69007,60.80685,83.68946,100.37111)
##D         theta <- 0.2
##D         options <- list(nchains = 2, niter = 4000, nadapt = 0.8)
##D         x <- c(1,2,3,4,5,6)
##D         y <- c(FALSE,FALSE,FALSE,FALSE,TRUE,FALSE)
##D 
##D         res <- dtox(y, doses, x, theta, options = options)
##D     
## End(Not run)



