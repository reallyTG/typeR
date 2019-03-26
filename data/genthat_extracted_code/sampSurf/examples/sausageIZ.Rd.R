library(sampSurf)


### Name: sausageIZ
### Title: Generate Objects of Class "'sausageIZ'"
### Aliases: sausageIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=40, solidType=4, logAngle=4*pi/3, logLen=6)
iz.sa = sausageIZ(dl, plotRadius=3)
summary(iz.sa)
plot(iz.sa, axes=TRUE, showPlotCenter=TRUE, cex=2, showNeedle=TRUE)



