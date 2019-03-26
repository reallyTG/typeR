library(plotrix)


### Name: getMarginWidth
### Title: Find the margin width necessary to fit text or a legend next to
###   a plot
### Aliases: getMarginWidth
### Keywords: misc

### ** Examples

 plot(rnorm(10))
 newmarinfo<-getMarginWidth(labels=c("Long label","Even longer label"))
 oldmar<-par("mar")
 par(mar=c(oldmar[1:3],newmarinfo$newmar))
 plot(rnorm(10))
 par(xpd=TRUE)
 text(rep(newmarinfo$marcenter,2),c(0.5,-0.5),
  c("Long label","Even longer label"))
 par(mar=oldmar,xpd=FALSE)



