library(wavemulcor)


### Name: local.multiple.correlation
### Title: Routine for local multiple correlation
### Aliases: local.multiple.correlation lmc
### Keywords: statistics multivariate local correlation local regression
###   moving regression

### ** Examples


## Based on  Figure 4 showing correlation structural breaks in Fernandez-Macho (2017).

library(wavemulcor)
options(warn = -1)

xrand1 <- wavemulcor::xrand1
xrand2 <- wavemulcor::xrand2
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

xx <- data.frame(xrand1,xrand2)

# ################################################################################################

xy.mulcor <- local.multiple.correlation(xx, M, window=window)

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

title <- paste("Local Multiple Correlation")
sub <- paste("first",b,"obs:",round(100*cor1,1),"% correlation;","middle",b,"obs:",
             round(100*cor2,1),"%","rest:",round(100*cor3,1),"%")
xlab <- "time"
ylab <- "correlation"

matplot(1:N,cbind(val,lo,up),
        main=title, #sub=sub,
        xlab=xlab, ylab=ylab, type="l", lty=1, col= c(1,2,2), cex.axis=0.75)
abline(h=0) ##Add Straight horiz and vert Lines to a Plot

#reset graphics parameters
par(old.par)




