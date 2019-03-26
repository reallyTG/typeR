library(fpc)


### Name: fixreg
### Title: Linear Regression Fixed Point Clusters
### Aliases: fixreg summary.rfpc plot.rfpc fpclusters.rfpc
###   print.summary.rfpc print.rfpc rfpi
### Keywords: cluster robust regression

### ** Examples

set.seed(190000)
options(digits=3)
data(tonedata)
attach(tonedata)
tonefix <- fixreg(stretchratio,tuned,mtf=1,ir=20)
summary(tonefix)
# This is designed to have a fast example; default setting would be better.
# If you want to see more (and you have a bit more time),
# try out the following:
## Not run: 
##D  set.seed(1000)
##D  tonefix <- fixreg(stretchratio,tuned)
##D # Default - good for these data
##D  summary(tonefix)
##D  plot(tonefix,stretchratio,tuned,1)
##D  plot(tonefix,stretchratio,tuned,2)
##D  plot(tonefix,stretchratio,tuned,3,bw=FALSE,pch=5) 
##D  toneclus <- fpclusters(tonefix,stretchratio,tuned)
##D  plot(stretchratio,tuned,col=1+toneclus[[2]])
##D  tonefix2 <- fixreg(stretchratio,tuned,distcut=1,mtf=1,countmode=50)
##D # Every found fixed point cluster is reported,
##D # no matter how instable it may be.
##D  summary(tonefix2)
##D  tonefix3 <- fixreg(stretchratio,tuned,ca=7)
##D # ca defaults to 10.07 for these data.
##D  summary(tonefix3)
##D  subset <- c(rep(FALSE,5),rep(TRUE,24),rep(FALSE,121))
##D  tonefix4 <- fixreg(stretchratio,tuned,
##D                     mtf=1,ir=0,init.group=list(subset))
##D  summary(tonefix4)
## End(Not run)



