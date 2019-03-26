library(gplots)


### Name: wapply
### Title: Compute the Value of a Function Over a Local Region Of An X-Y
###   Plot
### Aliases: wapply
### Keywords: dplot

### ** Examples


#show local mean and inner 2-sd interval to help diagnose changing mean
#or variance structure
x <- 1:1000
y <- rnorm(1000, mean=1, sd=1 + x/1000 )

plot(x,y)
lines(wapply(x,y,mean),col="red")

CL <- function(x,sd) mean(x)+sd*sqrt(var(x))

lines(wapply(x,y,CL,sd= 1),col="blue") 
lines(wapply(x,y,CL,sd=-1),col="blue") 
lines(wapply(x,y,CL,sd= 2),col="green")
lines(wapply(x,y,CL,sd=-2),col="green")

#show local mean and inner 2-sd interval to help diagnose changing mean
#or variance structure
x <- 1:1000
y <- rnorm(1000, mean=x/1000, sd=1)

plot(x,y)
lines(wapply(x,y,mean),col="red")

CL <- function(x,sd) mean(x)+sd*sqrt(var(x))

lines(wapply(x,y,CL,sd= 1,method="fraction",width=1/20),col="blue")
lines(wapply(x,y,CL,sd=-1,method="fraction",width=1/20),col="blue")
lines(wapply(x,y,CL,sd= 2,method="nobs",width=250),col="green")
lines(wapply(x,y,CL,sd=-2,method="nobs",width=250),col="green")





