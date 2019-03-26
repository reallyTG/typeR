library(fsdaR)


### Name: FSR_control
### Title: Creates an 'FSR_control' object
### Aliases: FSR_control
### Keywords: robust regression

### ** Examples

(out <- fsreg(Y~., data=hbk, method="FS", control=FSR_control(h=56, nsamp=500, lms=2)))
summary(out)



