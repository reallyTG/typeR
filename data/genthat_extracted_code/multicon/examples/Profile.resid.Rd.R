library(multicon)


### Name: Profile.resid
### Title: Residuals
### Aliases: Profile.resid
### Keywords: Residual Profile Agreement Distinctiveness

### ** Examples

data(acq1)
data(caq)
	#Lets get the regression coeficients for predicting aquaintance 
	#California Adult Q-Set (CAQ) personality ratings from #self-report CAQ ratings 
Profile.reg(caq,acq1)
	#We can look at the residuals from those regressions
res.acq <- Profile.resid(acq1, caq)
head(res.acq)

	


