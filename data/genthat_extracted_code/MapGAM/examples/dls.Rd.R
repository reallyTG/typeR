library(MapGAM)


### Name: dls
### Title: Calculating Derivatives of Partial Likelihood for Cox
###   Proportional Hazard Additive Models
### Aliases: dls
### Keywords: misc smooth

### ** Examples

## No test: 
data(CAdata)
Y = CAdata[,c("time","event")]
X = CAdata[,c(3:5)]
eta = coxph(Surv(time,event)~AGE,data=CAdata)$linear.predictors
result = dls(Y,X,1:2,eta,span=0.2)
plot(eta,result$deltaeta)
## End(No test)



