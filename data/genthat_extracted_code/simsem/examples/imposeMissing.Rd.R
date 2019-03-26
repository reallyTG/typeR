library(simsem)


### Name: imposeMissing
### Title: Impose MAR, MCAR, planned missingness, or attrition on a data
###   set
### Aliases: imposeMissing impose

### ** Examples

data <- matrix(rep(rnorm(10,1,1),19),ncol=19)
datac <- cbind(data,rnorm(10,0,1),rnorm(10,5,5))

# Imposing Missing with the following arguments produces no missing values
imposeMissing(data)
imposeMissing(data,cov=c(1,2))
imposeMissing(data,pmMCAR=0)
imposeMissing(data,pmMAR=0)
imposeMissing(data,nforms=0)

#Some more usage examples

# No missing at variables 1 and 2
imposeMissing(data,cov=c(1,2),pmMCAR=.1)

# 3-Form design
imposeMissing(data,nforms=3)

# 3-Form design with specified groups of items (XABC)
imposeMissing(data, nforms = 3, itemGroups =
	list(c(1,2,3,4,5), c(6,7,8,9,10), c(11,12,13,14,15), c(16,17,18,19)))

# 3-Form design when variables 20 and 21 are not missing
imposeMissing(datac,cov=c(20,21),nforms=3)

# 2 method design where the expensive measure is on Variable 19
imposeMissing(data,twoMethod=c(19,.8))

# Impose missing data with percent attrition of 0.1 in 5 time points
imposeMissing(datac,cov=21,prAttr=.1,timePoints=5)

# Logistic-regression MAR
colnames(data) <- paste("y", 1:ncol(data), sep="")
script <- 'y1 ~ 0.05 + 0.1*y2 + 0.3*y3
		y4 ~ -2 + 0.1*y4
		y5 ~ -0.5'
imposeMissing(data, logit=script)



