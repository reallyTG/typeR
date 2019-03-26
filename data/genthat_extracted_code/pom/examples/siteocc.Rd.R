library(pom)


### Name: siteocc
### Title: Fitting Patch Occupancy Models
### Aliases: siteocc
### Keywords: models

### ** Examples

data(weta.data)

# INTERCEPT-ONLY MODEL
fit1 <- siteocc(~1, ~1, histories=weta.data$detection.histories, start=c(1,1))

# BETA-BINOMIAL MIXTURE MODEL
fit2 <- siteocc(~1, ~Beta.mixture, histories=weta.data$detection.histories, 
	lower=c(log(0.01),0.0001,0.0001))

# MODEL TESTING BROWSED AND OBSERVER EFFECTS
fit3 <- siteocc(~weta.data$siteCovar$Browsed, ~weta.data$Obs1 + weta.data$Obs2, 
	histories=weta.data$detection.histories, start=c(0,2,0,-1,0), control=list(iter.max=50))

# MODEL WHICH ALSO FITS A SITE COVARIATE TO THE PROBABILITY OF DETECTION
numvisits=5
p.Browse <- matrix(rep(weta.data$siteCovar$Browsed, numvisits), ncol=numvisits)
fit4 <- siteocc(~1, ~p.Browse + weta.data$Obs1 + weta.data$Obs2, 
	histories=weta.data$detection.histories)



