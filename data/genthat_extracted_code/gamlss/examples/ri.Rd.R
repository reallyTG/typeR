library(gamlss)


### Name: ri
### Title: Specify ridge or lasso Regression within a GAMLSS Formula
### Aliases: ri
### Keywords: regression

### ** Examples

# USAIR DATA
X<-with(usair, cbind(x1,x2,x3,x4,x5,x6))
# standarise data 1-------------------------------------------------------------
sX<-scale(X)
# ridge
m1<- gamlss(y~ri(sX), data=usair)
# lasso
m2<- gamlss(y~ri(sX, Lp=1), data=usair)
# best subset
m3<- gamlss(y~ri(sX, Lp=0), data=usair)
#--------  plotting the coefficients
op <- par(mfrow=c(3,1))
plot(getSmo(m1)) #
plot(getSmo(m2))
plot(getSmo(m3))
par(op)



