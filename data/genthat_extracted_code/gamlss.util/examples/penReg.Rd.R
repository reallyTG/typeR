library(gamlss.util)


### Name: penReg
### Title: Function to fit penalised regression
### Aliases: penReg penRegQ pbq gamlss.pbq
### Keywords: regression

### ** Examples

set.seed(1234)
x <- seq(0,10,length=200); y<-(yt<-1+2*x+.6*x^2-.1*x^3)+rnorm(200, 4)
library(gamlss)
#------------------ 
# df fixed
g1<-gamlss(y~pb(x, df=4))
m1<-penReg(y,x, df=4) 
cbind(g1$mu.coefSmo[[1]]$lambda, m1$lambda)
cbind(g1$mu.df, m1$edf)
cbind(g1$aic, m1$aic)
cbind(fitted(g1), fitted(m1))[1:10,]
# identical
#------------------
# estimate lambda using ML
g2<-gamlss(y~pb(x))
m2<-penReg(y,x) 
cbind(g2$mu.df, m2$edf)
cbind(g2$mu.lambda, m2$lambda) 
cbind(g2$aic, m2$aic) # different lambda
cbind(fitted(g2), fitted(m2))[1:10,]
# identical
#------------------
#  estimate lambda using GCV
g3 <- gamlss(y~pb(x, method="GCV"))
m3 <- penReg(y,x, method="GCV") 
cbind(g3$mu.df, m3$edf)
cbind(g3$mu.lambda, m3$lambda)
cbind(g3$aic, m3$aic)
cbind(fitted(g3), fitted(m3))[1:10,]
# almost identical
#------------------
#  estimate lambda using  GAIC(#=3)
g4<-gamlss(y~pb(x, method="GAIC", k=3))
m4<-penReg(y,x, method="GAIC", k=3) 
cbind(g4$mu.df, m4$edf )
cbind(g4$mu.lambda, m4$lambda)
cbind(g4$aic, m4$aic)
cbind(g4$mu.df, m4$df)
cbind(g4$mu.lambda, m4$lambda)
cbind(fitted(g4), fitted(m4))[1:10,]

#-------------------
plot(y~x)
lines(fitted(m1)~x, col="green")
lines(fitted(m2)~x, col="red")
lines(fitted(m3)~x, col="blue")
lines(fitted(m4)~x, col="yellow")
lines(fitted(m4)~x, col="grey")
# using the Q function

# the Q-function takes longer
system.time(g6<-gamlss(y~pbq(x)))
system.time(g61<-gamlss(y~pb(x)))
AIC(g6, g61)
#
system.time(m6<-penRegQ(y,x))
system.time(m61<-penReg(y,x)) 
AIC(m6, m61)

cbind(g6$mu.df, g61$mu.df,m6$edf, m61$edf)
cbind(g6$mu.lambda,g61$mu.lambda, m6$lambda, m61$lambda) 
cbind(g6$aic, AIC(g6), m6$aic, AIC(m6), m61$aic, AIC(m61)) 
cbind(fitted(g6), fitted(m6))[1:10,]



