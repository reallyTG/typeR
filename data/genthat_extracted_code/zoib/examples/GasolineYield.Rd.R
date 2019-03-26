library(zoib)


### Name: GasolineYield
### Title: Gasoline Yields Data
### Aliases: GasolineYield
### Keywords: datasets

### ** Examples

  ## Not run: 
##D   library(zoib)
##D   data("GasolineYield", package = "zoib")
##D   
##D   #################################################
##D 	#  fixed effects zoib with 
##D   #  batch as a 10-level qualitative variable
##D   ################################################
##D 
##D   eg.fixed <- zoib(yield ~ temp + as.factor(batch)| 1, 
##D               data=GasolineYield, joint = FALSE,  random = 0, 
##D               EUID = 1:nrow(d), zero.inflation = FALSE, 
##D               one.inflation = FALSE, n.iter = 1100, n.thin = 5, 
##D               n.burn=100)
##D   # yields 400 posterior draws (200 per chain) on the model parameters
##D   coeff <- eg.fixed$coef
##D   summary(coeff)
##D  
##D   ### check on convergence
##D 	traceplot(coeff)
##D 	autocorr.plot(coeff)
##D 	check.psrf(coeff)
##D 	   
##D   ### Design Matrix: Xb, Xd, Xb0, Xb1
##D   eg.fixed$Xb; eg.fixed$Xd;  eg.fixed$Xb0; eg.fixed$Xb1  
##D   
##D   # plot posterior mean of y vs. observed y to check on goodness of fit.
##D   ypred = rbind(eg.fixed$ypred[[1]],eg.fixed$ypred[[2]])
##D   post.mean= apply(ypred,2,mean); 
##D   plot(GasolineYield$yield, post.mean, col='blue',pch=2); 
##D   abline(0,1,col='red')
##D   
##D   ######################################################
##D   #  mixed effects zoib with batch as a random variable
##D   #####################################################
##D   eg.random <- zoib(yield ~ temp | 1 | 1, data=GasolineYield,
##D                   joint = FALSE, random=1, EUID=GasolineYield$batch,
##D                   zero.inflation = FALSE, one.inflation = FALSE,
##D                   n.iter=3200, n.thin=15, n.burn=200)
##D   sample2 <- eg.random$coeff
##D   summary(sample2)
##D   
##D   # check convergence on the regression coefficients
##D   traceplot(sample2)
##D   autocorr.plot(sample2) 
##D   check.psrf(sample2)
##D   
##D   # plot posterior mean of y vs. observed y to check on goodness of fit.
##D   ypred = rbind(eg.random$ypred[[1]],eg.random$ypred[[2]])
##D   post.mean= apply(ypred,2,mean); 
##D   plot(GasolineYield$yield, post.mean, col='blue',pch=2); 
##D   abline(0,1,col='red')
##D 	
## End(Not run)



