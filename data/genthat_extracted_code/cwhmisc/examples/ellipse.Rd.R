library(cwhmisc)


### Name: ellipse
### Title: Generate ellipses
### Aliases: ellipseC ellipse1 conf.ellipse
### Keywords: multivariate dplot

### ** Examples

  opar <- par(mfrow=c(1,1))
  k <- 60; m <- c(0,0); a <- 2; b <- 1; phi <- pi/7
  df1 <- 2; df2 <- 20
# show F for different confidence levels:
  p <- c(0.5, 0.75, 0.8, 0.95)
  qf(p, df1, df2) #  0.717735 1.486984 1.746189 3.492828
  el7 <- conf.ellipse(a,b,phi,df1,df2,p[2], k) + m
  plot(el7*1.8,type="n",xlab="Different confidence ellipses",ylab="")
  lines(conf.ellipse(a,b,phi,df1,df2,p[1],60) + m,lty=2,col="red")
  lines(conf.ellipse(a,b,phi,df1,df2,p[3],60) + m,lty=2,col="green")
  lines(conf.ellipse(a,b,phi,df1,df2,p[4],60) + m,lty=2,col="blue")
  lines(el7,lty=2,col="orange")
  leg1 <- paste(as.character(p*100),rep("percent",length(p)),sep="")
#  leg1 <- paste(as.character(p*100),rep("%",length(p)),sep="")
  col1 <- c("red", "orange","green","blue")
  legend(x="bottom",leg1,col=col1,
text.col="black",lty=c(2,2,2,2), merge=TRUE, bg='white', cex=0.9)
par(opar)
for(ii in 0:15){ x <- ellipseC(40,1,2,phi=pi/15*ii);lines(x,col=ii%%3+1)}



