library(extRemes)


### Name: Tphap
### Title: Daily Maximum and Minimum Temperature in Phoenix, Arizona.
### Aliases: Tphap
### Keywords: datasets

### ** Examples

data(Tphap)
str(Tphap)

par( mfrow=c(2,1))
hist( Tphap[,"MaxT"], main="", xlab="Max Temp", xlim=c(60,120), freq=FALSE, breaks="FD", col="red")
hist( Tphap[,"MinT"], main="", xlab="Min Temp", xlim=c(60,120), freq=FALSE, breaks="FD", col="blue")



