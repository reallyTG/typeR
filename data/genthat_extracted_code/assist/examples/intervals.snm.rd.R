library(assist)


### Name: intervals.snm
### Title: Calculate Predictions and Approximate Posterior Standard
###   Deviations for Spline Estimate From a snm Object
### Aliases: intervals.snm
### Keywords: file

### ** Examples

data(horm.cort)

## extract normal dubjects
cort.nor<- horm.cort[horm.cort$type=="normal",]

## fit a self-modelling model with random effects
cort.fit<- snm(conc~b1+exp(b2)*f(time-alogit(b3)), 
  func=f(u)~list(periodic(u)), fixed=list(b1~1), 
  random=pdDiag(b1+b2+b3~1), data=cort.nor, 
  groups= ~ID,start=mean(cort.nor$conc))

## note the variable name of newdata
intervals(cort.fit, newdata=data.frame(u=seq(0,1,len=50)))



