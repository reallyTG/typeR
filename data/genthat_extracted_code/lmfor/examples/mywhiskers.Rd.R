library(lmfor)


### Name: mywhiskers
### Title: A whiskers type residual plot
### Aliases: mywhiskers
### Keywords: graphs

### ** Examples

x<-seq(1,100,1)
y<-x+10*log(x)+rnorm(100,0,5)
fm1<-lm(y~x)
plot(x,resid(fm1))
mywhiskers(x,resid(fm1),se=FALSE,add=TRUE)
mywhiskers(x,resid(fm1),se=TRUE,lwd=2,add=TRUE)
abline(h=0)



