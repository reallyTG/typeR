library(wgeesel)


### Name: QIC.gee
### Title: QIC and QICu for GEE
### Aliases: QIC.gee
### Keywords: QIC gee

### ** Examples

data(imps)
fit <- wgee(Y ~ Drug+Sex+Time, data=imps, id=imps$ID, family="binomial",
            corstr="exchangeable")

QIC.gee(fit)

data(seizure)
###reshapre the seizure data to "long" format
seiz.long <- reshape(seizure, varying=list(c("base","y1", "y2", "y3", "y4")),
                      v.names="y", times=0:4, direction="long")
seiz.long <- seiz.long[order(seiz.long$id, seiz.long$time),]

fit <- wgee(y ~ age + trt + time, data=seiz.long, id=seiz.long$id, 
            family="poisson", corstr="independence")

QIC.gee(fit)



