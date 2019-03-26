library(ACSWR)


### Name: swiss
### Title: Forged Swiss Bank Notes
### Aliases: swiss
### Keywords: histogram smoothing

### ** Examples

data(swiss)
par(mfrow=c(1,3))
hist(swiss$Bottforg,breaks=28,probability=TRUE,col=0,ylim=c(0,.5),
  xlab="Margin width (mm)",ylab="Density")
hist(swiss$Bottforg,breaks=12,probability=TRUE,col=0,ylim=c(0,.5),
  xlab="Margin width (mm)",ylab="Density")
hist(swiss$Bottforg,breaks=6,probability=TRUE,col=0,ylim=c(0,.5),
  xlab="Margin width (mm)",ylab="Density")



