library(Publish)


### Name: trace
### Title: trace data
### Aliases: trace
### Keywords: datasets

### ** Examples


data(trace)
Units(trace,list("age"="years"))
fit <- glm(dead ~ smoking+sex+age+Time+offset(log(ObsTime)), family="poisson",data=trace)
rtf <- regressionTable(fit,factor.reference = "inline")
summary(rtf)
publish(fit)




