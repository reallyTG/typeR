library(cwhmisc)


### Name: lowess.bygroup
### Title: Plot data in groups, each group with separate lowess smoothing
### Aliases: lowess.bygroup
### Keywords: hplot

### ** Examples

  par(mfrow=c(1,1))
  gr <- c(rep(1,20),rep(2,30),rep(3,50))
  x <- seq_along(gr); y <- jitter(0.01*(x-50)^2 + 1,1000)
  plot(x,y,pch=".",cex=4,xlab="Lowess, with spans = 0.2 (r,g,mag), 0.4 (blue) ")
  lowess.bygroup(x,y,gr,span=0.2,col=c("red","green","magenta"),lty=rep(2,3))
  lowess.bygroup(x,y,gr,span=0.4,col="blue")



