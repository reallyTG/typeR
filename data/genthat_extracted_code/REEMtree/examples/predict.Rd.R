library(REEMtree)


### Name: predict
### Title: Predictions from a regression tree with individual-specific
###   effects
### Aliases: predict.REEMtree
### Keywords: models tree

### ** Examples

data(simpleREEMdata)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID)
predict(REEMresult, simpleREEMdata, EstimateRandomEffects=FALSE)
predict(REEMresult, simpleREEMdata, id=simpleREEMdata$ID, EstimateRandomEffects=TRUE)

# Estimation based on a subset that excludes the last two time series, 
# with predictions for all observations
sub <- rep(c(rep(TRUE, 10), rep(FALSE, 2)), 50)
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID, 
	subset=sub)
pred1 <- predict(REEMresult, simpleREEMdata, EstimateRandomEffects=FALSE)
pred2 <- predict(REEMresult, simpleREEMdata, id=simpleREEMdata$ID, EstimateRandomEffects=TRUE)

# Estimation based on a subset that excludes the last five individuals, 
# with predictions for all observations
sub <- c(rep(TRUE, 540), rep(FALSE, 60))
REEMresult<-REEMtree(Y~D+t+X, data=simpleREEMdata, random=~1|ID, 
	subset=sub)
pred3 <- predict(REEMresult, simpleREEMdata, EstimateRandomEffects=FALSE)
pred4 <- predict(REEMresult, simpleREEMdata, id=simpleREEMdata$ID, EstimateRandomEffects=TRUE)




