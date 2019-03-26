library(forecTheta)


### Name: forecTheta-Package
### Title: Forecasting Time Series by Theta Models
### Aliases: forecTheta-package forecTheta
### Keywords: Dynamic Optimised Theta Model, Theta Method, Rolling Origin
###   Evaluation, Fixed Origin Evaluation, Time Series Forecasting, Error
###   Metric, Cross Validation

### ** Examples

##############################################################	

y1 = 2+ 0.15*(1:20) + rnorm(20)
y2 = y1[20]+ 0.3*(1:30) + rnorm(30)
y =  as.ts(c(y1,y2))
out <- dotm(y, h=10)
summary(out)
plot(out)

out <- dotm(y=as.ts(y[1:40]), h=10)
summary(out)
plot(out)

out2 <- stheta(y=as.ts(y[1:40]), h=10)
summary(out2)
plot(out2)

### sMAPE metric
errorMetric(obs=as.ts(y[41:50]), forec=out$mean, type = "sAPE", statistic = "M")
errorMetric(obs=as.ts(y[41:50]), forec=out2$mean, type = "sAPE", statistic = "M")

### sMdAPE metric
errorMetric(obs=as.ts(y[41:50]), forec=out$mean, type = "sAPE", statistic = "Md")
errorMetric(obs=as.ts(y[41:50]), forec=out2$mean, type = "sAPE", statistic = "Md")

### MASE metric
meanDiff1 = mean(abs(diff(as.ts(y[1:40]), lag = 1)))
errorMetric(obs=as.ts(y[41:50]), forec=out$mean, type = "AE", statistic = "M") / meanDiff1
errorMetric(obs=as.ts(y[41:50]), forec=out2$mean, type = "AE", statistic = "M") / meanDiff1

#### cross validation (2 origins)
#groe( y=y, forecFunction = otm.arxiv, m=5, n1=40, p=2, theta=5)
#groe( y=y, forecFunction = stheta, m=5, n1=40, p=2)

#### cross validation (rolling origin evaluation)
#rolOrig( y=y, forecFunction = otm.arxiv, n1=40, theta=5)
#rolOrig( y=y, forecFunction = stheta, n1=40)




