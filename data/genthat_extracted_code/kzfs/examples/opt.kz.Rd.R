library(kzfs)


### Name: optDR
### Title: Improve Accuracy of KZ Periodogram Estimation with Optimization
### Aliases: optDR optD2P

### ** Examples

dx <- 300				# x range
dy <- 300				# y range
b <- expand.grid(x=1:dx, y=1:dy)
q1 <- pi/3; f1 <- 0.2;
b$v1 <- sin(f1*2*pi*(b$x*cos(q1)+b$y*sin(q1))+100*runif(1))
q2 <- pi/6; f2 <- 0.05;
b$v2 <- sin(f2*2*pi*(b$x*cos(q2)+b$y*sin(q2))+100*runif(1))
a <- array(0,c(dx,dy))
a[as.matrix(b[,1:2])] <- b$v1 + 1.5*b$v2
noise <- 5*matrix(rnorm(dx*dy,0,1),ncol=dy)

# Identifying with 2D periodogram
# kzp2.demo <- kzp2(a+noise)$kzp2d
QF <- kzp2.summary(kzp2.demo, num=2)

# Optimization of the 2D periodogram
# It may take 1 to 5 minutes
# kzp2.QF <- optD2P(a+noise, QF, k1=1, n1=1)
kzp2.QF

# Optimization of directional periodogram
# It may take 10 to 20 minutes
# kzpdr.demo <- kzpdr(a+noise, c(0,45,15,35)*pi/180, plot=TRUE, dpct=0.05)$rec
# kzpde.QF <- optDR(a+noise, kzpdr.demo)

QF2 <- kzpdr.eval(kzpdr.demo)
opt.QF2 <- kzpdr.eval(kzpdr.QF)




