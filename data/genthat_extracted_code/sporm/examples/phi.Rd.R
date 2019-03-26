library(sporm)


### Name: phi
### Title: Function phi(t)
### Aliases: phi

### ** Examples

# Use radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
# Dabrowska-Doksum's estimate of theta
theta0.hat<-dd.est(x,y)
m<-length(x)
n<-length(y)
N<-m+n
lambda<-m/N
phat0<-phi(N, theta0.hat, lambda)/N



