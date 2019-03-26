library(wavemulcor)


### Name: wave.local.multiple.correlation
### Title: Wavelet routine for local multiple correlation
### Aliases: wave.local.multiple.correlation wlmc
### Keywords: statistics multivariate local correlation local regression
###   moving regression wavelet

### ** Examples


## Based on  Figure 4 showing correlation structural breaks in Fernandez-Macho (2017).

library(wavemulcor)
library(plot3D)
options(warn = -1)

data(xrand)
N <- length(xrand1)
b <- trunc(N/3)
t1 <- 1:b
t2 <- (b+1):(2*b)
t3 <- (2*b+1):N

wf <- "d4"
M <- N/2^3 #sharper with N/2^4
window <- "gaussian"

J <- trunc(log2(N))-3

# ################################################################################################

cor1 <- cor(xrand1[t1],xrand2[t1])
cor2 <- cor(xrand1[t2],xrand2[t2])
cor3 <- cor(xrand1[t3],xrand2[t3])
cortext <- paste0(round(100*cor1,0),"-",round(100*cor2,0),"-",round(100*cor3,0))

ts.plot(cbind(xrand1,xrand2),col=c("red","blue"),xlab="time")

xrand1.modwt <- modwt(xrand1, wf, J)
xrand1.modwt.bw <- brick.wall(xrand1.modwt, wf)

xrand2.modwt <- modwt(xrand2, wf, J)
xrand2.modwt.bw <- brick.wall(xrand2.modwt, wf)

xx <- list(xrand1.modwt.bw,xrand2.modwt.bw)

# ################################################################################################

xy.mulcor <- wave.local.multiple.correlation(xx, M, window=window)

val <- as.matrix(xy.mulcor$val)
lo  <- as.matrix(xy.mulcor$lo)
up  <- as.matrix(xy.mulcor$up)
YmaxR <- as.matrix(xy.mulcor$YmaxR)

# ################################################################################################
old.par <- par()

# ##Producing heat plot

scale.names <- paste0("(",c("2-4","4-8","8-16","16-32","32-64","64-128","128-256","256-512",
                            "512-1024","1024-2048"),"]")
scale.names <- c(scale.names[1:J],"smooth")

title <- paste("Wavelet Local Multiple Correlation")
sub <- paste("first",b,"obs:",round(100*cor1,1),"% correlation;","middle",b,"obs:",
             round(100*cor2,1),"%","rest:",round(100*cor3,1),"%")
xlab <- "time"
ylab <- "periods"

image2D(z=val, x=1:nrow(val), y=1:ncol(val),
        main=title, #sub=sub,
        xlab=xlab, ylab=ylab, axes=FALSE, clab = expression(varphi),
        rasterImage = TRUE, contour = list(lwd = 2, col = jet.col(11)))
axis(side=1, at=seq(10,nrow(val),by=10), cex.axis=0.75)
axis(side=2, at=1:ncol(val),labels=scale.names, las=1,cex.axis=0.75)


################################################################################################
##Producing line plots with confidence intervals

colnames(val)[1:J] <- paste0("level",1:J)
par(mfrow=c(3,2), las=1, pty="m", mar=c(2,3,1,0)+.1, oma=c(1.2,1.2,0,0))
for(i in J:1) {
  matplot(1:N,val[,i], type="l", lty=1, ylim=c(-1,1), xaxt="n",
          xlab="", ylab="", main=colnames(val)[i])
  if(i<3) {axis(side=1, at=seq(10,N,by=10))}
  #axis(side=2, at=c(-.2, 0, .5, 1))
  lines(lo[,i], lty=1, col=2) ##Add Connected Line Segments to a Plot
  lines(up[,i], lty=1, col=2)
  abline(h=0)              ##Add Straight horiz and vert Lines to a Plot
}
par(las=0)
mtext('time', side=1, outer=TRUE, adj=0.5)
mtext('Wavelet Local Multiple Correlation', side=2, outer=TRUE, adj=0.5)


#reset graphics parameters
par(old.par)




