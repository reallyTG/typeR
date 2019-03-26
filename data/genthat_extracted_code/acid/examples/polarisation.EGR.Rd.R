library(acid)


### Name: polarisation.EGR
### Title: Polarisation Measure from Esteban, Gradin and Ray (2007)
### Aliases: polarisation.EGR

### ** Examples

## example 1
y<-rnorm(1000,5,0.5)
y<-sort(y)
m.y<-mean(y)
sd.y<-sd(y)
y1<-y[1:(length(y)/4)]
m.y1<-mean(y1)
sd.y1<-sd(y1)
y2<-y[(length(y)/4+1):length(y)]
m.y2<-mean(y2)
sd.y2<-sd(y2)
means<-c(m.y1,m.y2)
share1<- length(y1)/length(y)
share2<- length(y2)/length(y)
shares<- c(share1,share2)
rho<-data.frame(means=means,shares=shares)
alpha<-1
beta<-1
den<-density(y)
polarisation.ER(alpha,rho,comp=FALSE)
polarisation.EGR(alpha,beta,rho,y)$P
polarisation.EGR(alpha,beta,rho,y=den$x,f=den$y)$P
polarisation.EGR(alpha,beta,rho,y=seq(0,10,by=0.1),dist="norm",
mean=m.y,sd=sd.y)$P
polarisation.EGR(alpha,beta,rho,y=seq(0,10,by=0.1),dist="norm",
mean=m.y,sd=sd.y)$PG

## example 2
y1<-rnorm(100,5,1)
y2<-rnorm(100,1,0.1)
y <- c(y1,y2)
m.y1<-mean(y1)
sd.y1<-sd(y1)
m.y2<-mean(y2)
sd.y2<-sd(y2)
means<-c(m.y1,m.y2)
share1<- length(y1)/length(y)
share2<- length(y2)/length(y)
shares<- c(share1,share2)
rho<-data.frame(means=means,shares=shares)
alpha<-1
beta<-1
polarisation.EGR(alpha,beta,rho,y=seq(0,10,by=0.1),dist="norm",
                 mean=c(m.y1,m.y2),sd=c(sd.y1,sd.y2))$P




