library(wgeesel)


### Name: MQIC.gee
### Title: MQIC and MQICu for GEE
### Aliases: MQIC.gee
### Keywords: MQIC gee

### ** Examples

data(imps)

fit <- wgee(IMPS79 ~ Drug+Sex+Time, data=imps,id=imps$ID,family="gaussian",
             corstr="independence")
MQIC.gee(fit)


data(ohio)

fit2 <- wgee(resp ~ age + smoke+age:smoke, data=ohio, id=ohio$id, 
             family="binomial", corstr="independence")
MQIC.gee(fit2)





