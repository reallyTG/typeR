library(RSiena)


### Name: summary.iwlsm
### Title: Summary method for Iterative Weighted Least Squares Models
### Aliases: summary.iwlsm print.summary.iwlsm
### Keywords: models

### ** Examples

## Not run: 
##D ##not enough data here for a sensible example, but shows the idea.
##D myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=100)
##D mynet1 <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)))
##D mynet2 <- sienaDependent(array(c(s502, s503), dim=c(50, 50, 2)))
##D mydata1 <- sienaDataCreate(mynet1)
##D mydata2 <- sienaDataCreate(mynet2)
##D myeff1 <- getEffects(mydata1)
##D myeff2 <- getEffects(mydata2)
##D myeff1 <- setEffect(myeff1, transTrip, fix=TRUE, test=TRUE)
##D myeff2 <- setEffect(myeff2, transTrip, fix=TRUE, test=TRUE)
##D myeff1 <- setEffect(myeff1, cycle3, fix=TRUE, test=TRUE)
##D myeff2 <- setEffect(myeff2, cycle3, fix=TRUE, test=TRUE)
##D ans1 <- siena07(myalgorithm, data=mydata1, effects=myeff1, batch=TRUE)
##D ans2 <- siena07(myalgorithm, data=mydata2, effects=myeff2, batch=TRUE)
##D meta <- siena08(ans1, ans2)
##D metadf <- split(meta$thetadf, meta$thetadf$effects)[[1]]
##D metalm <- iwlsm(theta ~ tconv, metadf, ses=se^2)
##D summary(metalm)
## End(Not run)



