library(Brq)


### Name: Prostate
### Title: Prostate Cancer Data
### Aliases: Prostate
### Keywords: datasets

### ** Examples

data(Prostate)
y=Prostate[,9]
x=as.matrix(Prostate[, -9])
y=y-mean(y)
x=scale(x)
fit=Brq(y~0+x, method="BLqr")
plot(fit, plottype="hist",D=1:8)
plot(fit, plottype="hist",D=1:8, col2=4,lwd=2)
plot(fit, plottype="trace",D=1:8, col4=4)



