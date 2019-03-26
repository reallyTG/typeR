library(dlnm)


### Name: plot.crossreduce
### Title: Plot Predictions for a Reduced DLNM
### Aliases: plot.crossreduce lines.crossreduce points.crossreduce
### Keywords: hplot aplot

### ** Examples

# create the crossbasis object
lagnk <- 3
lagknots <- exp(((1+log(30))/(lagnk+1) * seq(lagnk))-1)
cb4 <- crossbasis(chicagoNMMAPS$temp, lag=30, argvar=list(fun="thr",
  thr=c(10,25)), arglag=list(knots=lagknots))

# # run the model and get the predictions
library(splines)
model4 <- glm(death ~  cb4 + ns(time, 7*14) + dow, family=quasipoisson(),
  chicagoNMMAPS)
pred4 <- crosspred(cb4, model4, by=1)

# reduce to overall cumulative association
redall <- crossreduce(cb4, model4)
summary(redall)
# reduce to exposure-response association for lag 5
redlag <- crossreduce(cb4, model4, type="lag", value=5)
# reduce to lag-response association for value 33
redvar <- crossreduce(cb4, model4, type="var", value=33)

# compare number of parameters
length(coef(pred4))
length(coef(redall))
length(coef(redlag))
length(coef(redvar))

# test
plot(pred4, "overall", xlab="Temperature", ylab="RR",
  ylim=c(0.8,1.6), main="Overall cumulative association")
lines(redall, ci="lines",col=4,lty=2)
legend("top",c("Original","Reduced"),col=c(2,4),lty=1:2,ins=0.1)

# reconstruct the fit in terms of uni-dimensional function
b4 <- onebasis(0:30,knots=attributes(cb4)$arglag$knots,intercept=TRUE)
pred4b <- crosspred(b4,coef=coef(redvar),vcov=vcov(redvar),model.link="log",by=1)

# test
plot(pred4, "slices", var=33, ylab="RR", ylim=c(0.9,1.2),
  main="Lag-response association at 33C")
lines(redvar, ci="lines", col=4, lty=2)
points(pred4b, pch=19, cex=0.6)
legend("top",c("Original","Reduced","Reconstructed"),col=c(2,4,1),lty=c(1:2,NA),
  pch=c(NA,NA,19),pt.cex=0.6,ins=0.1)



