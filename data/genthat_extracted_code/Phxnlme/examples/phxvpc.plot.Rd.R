library(Phxnlme)


### Name: phxvpc.plot
### Title: Create visual predictive check plot.
### Aliases: phxvpc.plot

### ** Examples

## Note: before plotting, first run model fit using phxnlme, 
## next perform VPC simulation using either phxvpc.sim or simmodel.
#setwd("C:/Program Files (x86)/Pharsight/Phoenix/application/Examples/NLME Command Line/Model 3")
#phxvpc.plot(vpcpath="vpc_1")
## or
#phxvpc.plot(vpcpath="C:/Program Files (x86)/Pharsight/Phoenix
#/application/Examples/NLME Command Line/Model 3/vpc_1")

## without showing lines for percentiles of the observation data points
#phxvpc.plot(vpcpath="vpc_1", Q.obs.line=F)

## showing lines for predicted percentiles
#phxvpc.plot(vpcpath="vpc_1", Q.pred.line=T)

## using lines instead of shaded area to indicate the confidence
## intervals for the predicted percentiles
#phxvpc.plot(vpcpath="vpc_1", CI.Q.pred="lines")

## changing color of shaded area
#phxvpc.plot(vpcpath="vpc_1", CI.Q.pred="area", CI.Q.pred.area1="green", CI.Q.pred.area2="yellow")

## changing x-axis limits
#phxvpc.plot(vpcpath="vpc_1", xlim=c(0,10))



