library(sporm)


### Name: mrle.sporm
### Title: Semiparametric proportional odds rate model.
### Aliases: mrle.sporm

### ** Examples

# Use radar tube life data
z<-RadarTube$Days
v<-RadarTube$Type
x<-z[v==1]; y<-z[v==2]
# Dabrowska-Doksum's estimate of theta
theta0.hat<-dd.est(x,y)
theta0.hat
vartheta0.hat<-dd.est(y,x)
vartheta0.hat
## mrle
m<-length(x)
n<-length(y)
N<-m+n
lambda<-m/N
phat0<-phi(N, theta0.hat, lambda)/N
mrle.sporm(x, y, theta0.hat, phat0)


