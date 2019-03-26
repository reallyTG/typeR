library(LPCM)


### Name: lpc
### Title: Local principal curves
### Aliases: lpc
### Keywords: smooth multivariate

### ** Examples


data(calspeedflow)
lpc1 <- lpc(calspeedflow[,3:4])
plot(lpc1)

data(mussels, package="dr")
 lpc2 <- lpc(mussels[,-3], x0=as.numeric(mussels[49,-3]),scaled=FALSE)
 plot(lpc2, curvecol=2)

data(gaia)
s <- sample(nrow(gaia),200)
gaia.pc <-  princomp(gaia[s,5:20])
lpc3 <- lpc(gaia.pc$scores[,c(2,1,3)],scaled=FALSE)
plot(lpc3, curvecol=2, type=c("curve","mass"))

# Simulated letter 'E' with branched LPC
ex<- c(rep(0,40), seq(0,1,length=20), seq(0,1,length=20), seq(0,1,length=20))
ey<- c(seq(0,2,length=40), rep(0,20), rep(1,20), rep(2,20))
sex<-rnorm(100,0,0.01); sey<-rnorm(100,0,0.01)
eex<-rnorm(100,0,0.1);  eey<-rnorm(100,0,0.1)
ex1<-ex+sex; ey1<-ey+sey
ex2<-ex+eex; ey2<-ey+eey
e1<-cbind(ex1,ey1); e2<-cbind(ex2,ey2)
lpc.e1 <- lpc(e1, h= c(0.1,0.1),  depth=2, scaled=FALSE)
plot(lpc.e1, type=c("curve","mass", "start"))



