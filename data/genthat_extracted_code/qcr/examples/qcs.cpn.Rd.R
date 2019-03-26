library(qcr)


### Name: qcs.cpn
### Title: ##' Process capability indices (Nonparametric)
### Aliases: qcs.cpn

### ** Examples

library(qcr)
##' data(pistonrings) 
xbar <- qcs.xbar(pistonrings[1:125,],plot = TRUE)
x<-xbar$statistics[[1]]
LSL=73.99; USL=74.01
median <-median(x)
lq=as.numeric(quantile(x,probs=0.00135))
uq=as.numeric(quantile(x,probs=0.99865))
qcs.cpn(parameters = c(0,0),limits = c(LSL,USL),
       median = median, q=c(lq,uq))
qcs.cpn(object = xbar,parameters = c(0,0), limits = c(LSL,USL))
qcs.cpn(object = xbar,parameters = c(1,0), limits = c(LSL,USL))
qcs.cpn(object = xbar,parameters = c(0,1), limits = c(LSL,USL))
qcs.cpn(object = xbar,parameters = c(1,1), limits = c(LSL,USL))



