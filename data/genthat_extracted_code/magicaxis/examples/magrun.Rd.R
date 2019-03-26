library(magicaxis)


### Name: magrun
### Title: Running averages
### Aliases: magrun
### Keywords: median mean mode quantile

### ** Examples

#Simple example

temp=cbind(seq(0,2,len=1e4),rnorm(1e4))
temprun=magrun(temp)
magplot(temp,col='lightgreen',pch='.')
lines(temprun,col='red')
lines(temprun$x,temprun$yquan[,1],lty=2,col='red')
lines(temprun$x,temprun$yquan[,2],lty=2,col='red')
temprun=magrun(temp,binaxis='y')
lines(temprun,col='blue')
lines(temprun$xquan[,1],temprun$y,lty=2,col='blue')
lines(temprun$xquan[,2],temprun$y,lty=2,col='blue')

#Now with a gradient- makes it clear why the axis choice matters for simple line fitting.

temp=cbind(seq(0,2,len=1e4),rnorm(1e4)+1+seq(0,2,len=1e4))
temprun=magrun(temp)
magplot(temp,col='lightgreen',pch='.')
lines(temprun,col='red')
lines(temprun$x,temprun$yquan[,1],lty=2,col='red')
lines(temprun$x,temprun$yquan[,2],lty=2,col='red')
temprun=magrun(temp,binaxis='y')
lines(temprun,col='blue')
lines(temprun$xquan[,1],temprun$y,lty=2,col='blue')
lines(temprun$xquan[,2],temprun$y,lty=2,col='blue')

#Compare the different centres.

temp=cbind(seq(0,2,len=1e4),rnorm(1e4)^2+seq(0,2,len=1e4))
temprunmedian=magrun(temp,type='median')
temprunmean=magrun(temp,type='mean')
temprunmode=magrun(temp,type='mode')
temprunmode2d=magrun(temp,type='mode2d')
magplot(temp,col='grey',pch='.',ylim=c(-2,5))
lines(temprunmedian,col='red')
lines(temprunmean,col='green')
lines(temprunmode,col='blue')
lines(temprunmode2d,col='orange')

#Choose your own bins.

temp=cbind(seq(0,2,len=1e4),rnorm(1e4)+1+seq(0,2,len=1e4))
temprun=magrun(temp,bins=c(0.1,0.5,0.7,1.2,1.3,2))
magplot(temp,col='lightgreen',pch='.')
points(temprun,col='red')

#Show the 'error in the mean' type data points. Comparing to the best fit line,
#it is clear they are much more meaningful at reflecting the error in the trend seen,
#but not the distribution (or scatter) of data around this.

temp=cbind(seq(0,2,len=1e3),rnorm(1e3)+1+seq(0,2,len=1e3))
temprun=magrun(temp,bins=5)
temprunNscale=magrun(temp,bins=5,Nscale=TRUE)
magplot(temp,col='lightgreen',pch='.')
magerr(temprun$x,temprun$y,temprun$x-temprun$xquan[,1], temprun$y-temprun$yquan[,1],
temprun$xquan[,2]-temprun$x, temprun$yquan[,2]-temprun$y, lty=2,length=0,col='blue')
magerr(temprunNscale$x,temprunNscale$y,temprunNscale$x-temprunNscale$xquan[,1],
temprunNscale$y-temprunNscale$yquan[,1],temprunNscale$xquan[,2]-temprunNscale$x,
temprunNscale$yquan[,2]-temprunNscale$y,col='red')
abline(lm(temp[,2]~temp[,1]),col='black')

#Or the above type of plot can be done more simply using the 'diff' flag.

temprun=magrun(temp,bins=5,diff=TRUE)
temprunNscale=magrun(temp,bins=5,Nscale=TRUE,diff=TRUE)
magplot(temp,col='lightgreen',pch='.')
magerr(temprun$x,temprun$y,temprun$xquan[,1], temprun$yquan[,1], temprun$xquan[,2],
temprun$yquan[,2],lty=2,length=0,col='blue')
magerr(temprunNscale$x,temprunNscale$y,temprunNscale$xquan[,1], temprunNscale$yquan[,1],
temprunNscale$xquan[,2],temprunNscale$yquan[,2],col='red')
abline(lm(temp[,2]~temp[,1]),col='black')

#Similar, but using the 'sd' output.

magplot(temp,col='lightgreen',pch='.')
magerr(temprun$x,temprun$y,temprun$xsd,temprun$ysd,lty=2,length=0,col='blue')
magerr(temprunNscale$x,temprunNscale$y,temprunNscale$xsd,temprunNscale$ysd,col='red')
abline(lm(temp[,2]~temp[,1]),col='black')



