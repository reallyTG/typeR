library(funFEM)


### Name: velov
### Title: The Vélov data set
### Aliases: velov
### Keywords: datasets

### ** Examples

data(velov)
matplot(t(velov$data[1:5,]),type='l',lty=1,col=2:5,xaxt='n',lwd=2,ylim=c(0,1))
axis(1,at=seq(5,181,6),labels=velov$dates[seq(5,181,6)],las=2)



