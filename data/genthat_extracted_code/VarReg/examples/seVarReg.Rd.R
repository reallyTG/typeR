library(VarReg)


### Name: seVarReg
### Title: SE calculations for mean and variance regression models
### Aliases: seVarReg

### ** Examples

data(mcycle)
##Fit model with range as a covariate in the mean and the variance model
semimodel<-semiVarReg(mcycle$accel, mcycle$times, meanmodel="semi", varmodel="linear",
knots.m=4, maxit=10000)
##Calculate SE
se1<-seVarReg(semimodel, boot=FALSE)
##not run: with bootstrapping
##se2<-seVarReg(semimodel, boot=TRUE, bootreps=10)
##not run: calculate mean and SE for a given sequence
##test.seq<-seq(min(mcycle$times), max(mcycle$times),
##by=((max(mcycle$times)-min(mcycle$times))/999))
##se2<-seVarReg(semimodel, boot=TRUE, bootreps=10, vector.mean=test.seq)



