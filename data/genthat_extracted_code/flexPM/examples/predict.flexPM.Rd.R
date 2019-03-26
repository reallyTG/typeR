library(flexPM)


### Name: predict.flexPM
### Title: Prediction from Fitted Flexible Parametric Models
### Aliases: predict.flexPM
### Keywords: methods distribution

### ** Examples


# Using simulated data

set.seed(1111); n <- 1000
x <- runif(n)
t <- rnorm(n, 1 + x, 1 + x)
model <- flexPM(Surv(t) ~ x + I(x^2)) 
# using polynomials (e.g. x^2) to achieve flexibility



# Prediction of the conditional cumulative distribution function (CDF)
# and the probability density function (PDF)

pred <- predict(model, type = "CDF") # predict the CDF and PDF

plot(pnorm(t, 1 + x, 1 + x), exp(pred$log.F))
abline(0,1, col = "green", lwd = 3) # true vs fitted CDF

plot(dnorm(t, 1 + x, 1 + x), exp(pred$log.f))
abline(0,1, col = "green", lwd = 3) # true vs fitted PDF



# Prediction of quantiles

predMe <- predict(model, type = "QF", p = 0.5) # predict the median
plot(x,t)
points(x, predMe$p0.5, col = "green") # fitted median
abline(1,1, col = "red", lwd = 3) # true median = 1 + x



# Simulate data from the fitted model

t.sim <- predict(model, type = "sim")
plot(quantile(t.sim, (1:9)/10), quantile(t, (1:9)/10)); abline(0,1)
# if the model is good, t and t.sim should have a similar distribution



######### Using new data #############################

newdata <- data.frame(t = c(0,1,2), x = c(0.1,0.5,0.9))
# note that new 't' is only needed for type = "CDF"

predict(model, type = "CDF", newdata = newdata)
predict(model, type = "QF", newdata = newdata, p = c(0.25,0.5,0.75))
predict(model, type = "sim", newdata = newdata)




