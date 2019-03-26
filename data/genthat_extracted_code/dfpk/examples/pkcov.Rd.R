library(dfpk)


### Name: pkcov
### Title: Dose finding method PKCOV.
### Aliases: pkcov
### Keywords: models

### ** Examples

    ## Not run: 
##D         doses <- c(12.59972,34.65492,44.69007,60.80685,83.68946,100.37111)
##D         theta <- 0.2
##D         AUCs <-  c(0.43, 1.4, 5.98, 7.98, 11.90, 3.45)
##D         x <- c(1,2,3,4,5,6)
##D         y <- c(FALSE,FALSE,FALSE,FALSE,TRUE,FALSE)
##D         deltaAUC <- c(0, 1.3, -0.34, -2.7, 0.39, -2.45)
##D         options <- list(nchains = 2, niter = 4000, nadapt = 0.8)
##D         res <- pkcov(y, AUCs, doses, x, theta, deltaAUC, options=options)
##D     
## End(Not run)



