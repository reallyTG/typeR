library(funFEM)


### Name: velib
### Title: The Vélib data set
### Aliases: velib
### Keywords: datasets

### ** Examples

data(velib)
matplot(t(velib$data[1:5,]),type='l',lty=1,col=2:5,xaxt='n',lwd=2,ylim=c(0,1))
axis(1,at=seq(5,181,6),labels=velib$dates[seq(5,181,6)],las=2)



