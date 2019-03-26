library(VarReg)


### Name: plotVarReg
### Title: Plots graphics for a mean and variance regression model
### Aliases: plotVarReg

### ** Examples

data(mcycle)
linmodel<-semiVarReg(mcycle$accel, mcycle$times, meanmodel="linear", varmodel="linear",
maxit=10000)
plotVarReg(linmodel)
plotVarReg(linmodel, ci=TRUE, ci.type="im", ylab="Range", xlab="Time in seconds")
##not run
##plotVarReg(linmodel, ci=TRUE, ci.type="boot", bootreps=10,ylab="Acceleration",
##xlab="Time in seconds")

##not run
##semimodel<-semiVarReg(mcycle$accel, mcycle$times, meanmodel="semi", varmodel="semi",
##knots.m=4, knots.v=2, maxit=10000)
##plotVarReg(semimodel, ci=TRUE, ci.type="boot",bootreps=10,ylab="Acceleration",
##xlab="Time in seconds", maxit=10000)



