library(artfima)


### Name: SB32
### Title: Turbulent flow data from Station SB32
### Aliases: SB32
### Keywords: datasets

### ** Examples

data(SB32)
str(SB32)

#Figure from our paper
## Not run: 
##D ans0 <- artfima(SB32, fixd=5/6)
##D ans1 <- artfima(SB32, arimaOrder=c(1,0,2)) #best
##D p <- ans1$arimaOrder[1]
##D q <- ans1$arimaOrder[3]
##D sigmaSq1 <- ans1$sigmaSq
##D sigmaSq0 <- ans0$sigmaSq
##D w <- SB32
##D n <- length(w)
##D Ip <- Periodogram(w)
##D fr <- (1/n)*(1:length(Ip))
##D plot(log(fr), log(Ip), xlab="log frequency", ylab="log power", 
##D      type="p", col=rgb(0,0,1,0.4), pch=16)
##D y <- sigmaSq1*artfimaSDF(n=length(SB32), obj=ans1, plot="none")
##D lines(log(fr), log(y), type="l", lwd=2.5, col="red")
##D y0 <- sigmaSq0*artfimaSDF(n=length(SB32), obj=ans0, plot="none")
##D lines(log(fr), log(y0), type="l", lwd=3.5, col="green", lty=2)
##D TFD_label <- expression(paste("TFD, ", delta == 5/6, ", ", 
##D                               hat(lambda) == 0.045))
##D legend(x=-8, y=-5, xjust=0, yjust=0, legend=c("ARTFIMA(1,0,2)", TFD_label), 
##D        lty=c(1,2), lwd=c(2.5,3.5), col=c("red", "green"), bty="n")
## End(Not run)




