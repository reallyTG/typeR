library(gamlss.add)


### Name: penLags
### Title: Penalised Lag Regression Function
### Aliases: penLags
### Keywords: regression

### ** Examples


# generating data
y <- arima.sim(500, model=list(ar=c(.9,-.8)))
#----------------------------------
#fitting model with different order
m0 <- penLags(y,y, lag=20, order=0)
m1 <- penLags(y,y, lag=20, order=1)
m2 <- penLags(y,y, lag=20, order=2)
m3 <- penLags(y,y, lag=20, order=3)   
# chosing the order
AIC(m0, m1, m2, m3)
#---------------------------------
# look at the AR coefficients of the models
op <- par(mfrow=c(2,2))
 plot(coef(m0,"AR"), type="h")
 plot(coef(m1, "AR"), type="h")
 plot(coef(m2, "AR"), type="h")
 plot(coef(m3,"AR"), type="h")
par(op)
#-------------------------------
# refit and  plotting model
m1 <- penLags(y,y, lag=20, order=1, plot=TRUE)

# looking at the residuals
plot(resid(m1))
acf(resid(m1))
pacf(resid(m1))
# or better use plot, wp or dtop
plot(m1, ts=TRUE)
wp(m1)
dtop(m1)
# the coefficients
coef(m1)
coef(m1, "AR")
coef(m1, 'varComp')
#
print(m1)
#summary(m1)
# use prediction
plot(ts(c(y, predict(m1,100))))



