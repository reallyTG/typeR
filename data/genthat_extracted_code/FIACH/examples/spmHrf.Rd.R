library(FIACH)


### Name: spmHrf
### Title: Canonical Haemodynamic Response Function.
### Aliases: spmHrf

### ** Examples

RT<-1/16
can.hrf<-spmHrf(RT)[[1]]
x<-seq(0,32,RT)
plot(x,can.hrf,lwd=7,col="red",type="l",
main="Canonical HRF",xlab="Time(seconds)",
ylab="Intensity(A.U.)")



