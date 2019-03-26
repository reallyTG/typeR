library(forecTheta)


### Name: Error Metric
### Title: Error Metric Function
### Aliases: errorMetric
### Keywords: error metric sMAPE sMdAPE MAE MdAE MSE MdSE

### ** Examples

##############################################################	

y1 = 2+ 0.15*(1:20) + rnorm(20,2)
y2 = y1[20]+ 0.3*(1:30) + rnorm(30,2)
y =  as.ts(c(y1,y2))

out <- dotm(y=as.ts(y[1:40]), h=10)

### sMAPE metric
errorMetric(obs=as.ts(y[41:50]), forec=out$mean)

### sMdAPE metric
errorMetric(obs=as.ts(y[41:50]), forec=out$mean, statistic = "Md")

### MASE metric
meanDiff1 = mean(abs(diff(as.ts(y[1:40]), lag = 1)))
errorMetric(obs=as.ts(y[41:50]), forec=out$mean, type = "AE", statistic = "M") / meanDiff1



