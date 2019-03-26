library(gamlss)


### Name: rvcov
### Title: Robust Variance-Covariance matrix of the parameters from a
###   fitted GAMLSS model
### Aliases: rvcov get.K
### Keywords: regression

### ** Examples

# gererate from a gamma distribution 
Y <- rGA(200, mu=1, sigma=2)
hist(Y)
# fitting the wrong model i.e. sigma=1 
m1 <- gamlss(Y~1, family=EXP) 
# the conventinal se is too precise 
vcov(m1, type="se")
# the sandwich se is wider  
rvcov(m1, type="se") 
# fitting the correct model 
 m2 <- gamlss(Y~1, family=GA)
 vcov(m2, type="se")
 rvcov(m2, type="se")
# similar stadard errors
# also obtained using 
vcov(m2, type="se", robust=TRUE)





