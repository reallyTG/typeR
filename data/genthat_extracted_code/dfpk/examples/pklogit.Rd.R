library(dfpk)


### Name: pklogit
### Title: Dose finding method PKLOGIT.
### Aliases: pklogit
### Keywords: models

### ** Examples

    ## Not run: 
##D         doses <- c(12.59972,34.65492,44.69007,60.80685,83.68946,100.37111)
##D         theta <- 0.2
##D         options <- list(nchains = 2, niter = 4000, nadapt = 0.8)
##D         AUCs <-  c(0.43, 1.4, 5.98, 7.98, 11.90, 3.45)
##D         x <- c(1,2,3,4,5,6)
##D         y <- c(FALSE,FALSE,FALSE,FALSE,TRUE,FALSE)
##D 
##D         res <- pklogit(y, AUCs, doses, x, theta, options = options)
##D     
## End(Not run)



