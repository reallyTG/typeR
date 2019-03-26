library(zoib)


### Name: AlcoholUse
### Title: California County-level Teenager Monthly Alcohol Use data
### Aliases: AlcoholUse
### Keywords: datasets

### ** Examples

  ## Not run: 
##D   ##### eg3: modelling with clustered beta variables with inflation at 0
##D     library(zoib)
##D     data("AlcoholUse", package = "zoib")
##D     eg3 <- zoib(Percentage ~ Grade*Gender+MedDays|1|Grade*Gender+MedDays|1,
##D                 data = AlcoholUse, random = 1, EUID= AlcoholUse$County,
##D                 zero.inflation = TRUE,  one.inflation = FALSE, joint = FALSE, 
##D                 n.iter=5000, n.thin=20, n.burn=1000)  
##D     sample1 <- eg3$coeff
##D     summary(sample1)
##D     
##D     # check convergence on the regression coefficients
##D     traceplot(sample1); 
##D     autocorr.plot(sample1);
##D     check.psrf(sample1)
##D     
##D     # plot posterior mean of y vs. observed y to check on goodness of fit.
##D     ypred = rbind(eg3$ypred[[1]],eg3$ypred[[2]])
##D     post.mean= apply(ypred,2,mean); 
##D     par(mfrow=c(1,1),mar=c(4,4,0.5,0.5))
##D     plot(AlcoholUse$Percentage, post.mean, xlim=c(0,0.4),ylim=c(0,0.4), 
##D          col='blue', xlab='Observed y', ylab='Predicted y', main="")
##D     abline(0,1,col='red')
##D   
## End(Not run)



