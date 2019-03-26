library(FIACH)


### Name: naSpline
### Title: Interpolate NAs
### Aliases: naSpline

### ** Examples

x<-rnorm(100)
x[20]<-30
naData<-badData(x)
fixed<-naSpline(naData)
par(mfrow=c(2,1))
ts.plot(x)
ts.plot(fixed)




