library(drc)


### Name: chickweed
### Title: Germination of common chickweed (_Stellaria media_)
### Aliases: chickweed chickweed0
### Keywords: datasets

### ** Examples


## Incorrect analysis using a logistic regression model
## (treating event times as binomial data)
## The argument "type" specifies that binomial data are supplied 
chickweed.m0a <- drm(count/200 ~ time, weights = rep(200, 34), 
data = chickweed0, fct = LL.3(), type = "binomial")
summary(chickweed.m0a) # showing a summmary of the model fit (including parameter estimates)

## Incorrect analysis based on nonlinear regression
## LL.3() refers to the three-parameter log-logistic model
## As the argument "type" is not specified it is assumed that the data type
##  is continuous and nonlinear regression based on least squares estimation is carried out
chickweed.m0b <- drm(count/200 ~ time, data = chickweed0, fct = LL.3())
summary(chickweed.m0b)  # showing a summmary of the model fit (including parameter estimates)

## How to re-arrange the data for fitting the event-time model
## (only for illustration of the steps needed for converting a dataset, 
##  but in this case not needed as both datasets are already provided in "drc")
#chickweed <- data.frame(start = c(0, chickweed0$time), end = c(chickweed0$time, Inf)) 
#chickweed$count <- c(0, diff(chickweed0$count), 200 - tail(chickweed0$count, 1))
#head(chickweed)  # showing top 6 lines of the dataset
#tail(chickweed)  # showing bottom 6 lines

## Fitting the event-time model (by specifying the argument type explicitly)
chickweed.m1 <- drm(count~start+end, data = chickweed, fct = LL.3(), type = "event")
summary(chickweed.m1)  # showing a summmary of the model fit (including parameter estimates)

## Summary output with robust standard errors
## library(lmtest)
## library(sandwich)
## coeftest(chickweed.m1, vcov = sandwich)

## Calculating t10, t50, t90 for the distribution of viable seeds
ED(chickweed.m1, c(10, 50, 90))

## Plotting data and fitted regression curve
plot(chickweed.m1, xlab = "Time (hours)", ylab = "Proportion germinated", 
xlim=c(0, 340), ylim=c(0, 0.25), log="", lwd=2, cex=1.2)  
## Adding the fitted curve obtained using nonlinear regression
plot(chickweed.m0b, add = TRUE, lty = 2, xlim=c(0, 340), 
ylim=c(0, 0.25), log="", lwd=2, cex=1.2)
# Note: the event-time model has slightly better fit at the upper limit

## Enhancing the plot (to look like in the reference paper)
abline(h = 0.20011, lty = 3, lwd = 2)
text(-15, 0.21, "Upper limit: d", pos = 4, cex = 1.5)

segments(0,0.1,196,0.1, lty = 3, lwd = 2)
segments(196,0.1, 196, -0.1, lty = 3, lwd = 2)
text(200, -0.004, expression(paste("50% germination: ", t[50])), pos = 4, cex = 1.5)

abline(a = 0.20011/2-0.20011*20.77/4, b = 0.20011*20.77/4/196, lty = 3, lwd = 2)
#text(200, 0.1, expression(paste("Slope: ", b*(-d/(4*t[50])))), pos = 4, cex = 1.5)
text(200, 0.1, expression("Slope: b" %.% "constant"), pos = 4, cex = 1.5)
points(196, 0.1, cex = 2, pch = 0)


## Adding confidence intervals

## Predictions from the event-time model
#coefVec <- coef(chickweed.m1)
#names(coefVec) <- c("b","d","e")
#
#predFct <- function(tival)
#{
#    as.numeric(deltaMethod(coefVec, paste("d/(1+exp(b*(log(",tival,")-log(e))))"), 
#    vcov(chickweed.m1)))
#}
#predFctv <- Vectorize(predFct, "tival")
#
#etpred <- t(predFctv(0:340))
#lines(0:340, etpred[,1]-1.96*etpred[,2], lty=1, lwd=2, col="darkgray")
#lines(0:340, etpred[,1]+1.96*etpred[,2], lty=1, lwd=2, col="darkgray")
#
### Predictions from the nonlinear regression model
#nrpred <- predict(chickweed.m0b, data.frame(time=0:340), interval="confidence")
#lines(0:340, nrpred[,2], lty=2, lwd=2, col="darkgray")
#lines(0:340, nrpred[,3], lty=2, lwd=2, col="darkgray")




