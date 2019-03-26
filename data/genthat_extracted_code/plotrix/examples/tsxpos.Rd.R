library(plotrix)


### Name: tsxpos
### Title: Calculate equispaced x positions.
### Aliases: tsxpos
### Keywords: misc

### ** Examples

 # create a vector of numbers
 y<-rnorm(28)
 par(mfrow=c(2,1),mar=c(6,4,4,2))
 plot(y,main="Plot of the values")
 # convert it into a time series object
 yt<-ts(y,start=2011,frequency=12)
 # don't use the default axis
 plot(yt,main="Plot of the time series",xaxt="n",xlab="Month")
 labelpos<-tsxpos(yt)
 # display an axis showing the months only
 staxlab(1,labelpos,rep(month.abb,length.out=28))
 par(mfrow=c(1,1),mar=c(5,4,4,2))



