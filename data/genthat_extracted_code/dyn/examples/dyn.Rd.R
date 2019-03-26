library(dyn)


### Name: dyn
### Title: dynamic regression class
### Aliases: dyn $.dyn model.frame.dyn model.frame.irts model.frame.its
###   model.frame.ts model.frame.zoo model.frame.zooreg model.matrix.dyn
###   predict.dyn predict.ts predict.zoo fitted.dyn fitted.ts fitted.zoo
###   residuals.dyn residuals.ts residuals.zoo update.dyn anova.dyn
###   fitted.irts fitted.its fitted.zooreg predict.irts predict.its
###   predict.zooreg residuals.irts residuals.its residuals.zooreg
### Keywords: regression

### ** Examples

y <- ts(1:12, start = c(2000,2), freq = 4)^3
x <- ts(1:9, start = c(2000,3), freq = 4)^2

# can be used with numerous different regression functions
y.lm <- dyn$lm( window(y, start = c(2000,4)) ~ diff(x) )
y.lm <- dyn$lm( y ~ diff(x) )
y.glm <- dyn$glm( y ~ diff(x) )
y.loess <- dyn$loess( y ~ diff(x) )

y.lm <- dyn(lm(dyn(y ~ diff(x))))  # same
y.lm
summary(y.lm)
residuals(y.lm)
fitted(y.lm)
y2.lm <- update(y.lm, . ~ . + lag(x,-1))
y2.lm
anova(y.lm, y2.lm)

# examples of using data
dyn$lm(y ~ diff(x), list(y = y, x = x))
dyn$lm(y ~ diffx, list(y = y, diffx = diff(x)))

# invoke model.frame on formula as a dyn object
dyn$model.frame( y ~ diff(x) )

# superimpose a loess fit on Nile time series data
plot(Nile)
lines(fitted(dyn$loess(Nile ~ time(Nile))), col = "red")

# lag.zoo can take vector lags
set.seed(1)
yz <- zoo(rnorm(100)); xz <- zoo(rnorm(100))
yz.lm <- dyn$lm(yz ~ lag(xz, 0:-3))


###
# simulate series and then NA out 7:10 and predict them
###

library(dyn)
set.seed(123)
tz <- zoo(cbind(Y = 0, x = rnorm(10), z = rnorm(10)))

# simulate values
for(i in 2:10) {
 tz$Y[i] <- with(as.data.frame(tz), 
	2*Y[i-1] + 3*z[i] +4* x[i] + 5*x[i-1] + rnorm(1))
}

# keep copy of tz to compare later to simulated Y's
tz.orig <- tz

# NA out Y's that are to be predicted
tz[7:10, "Y"] <- NA

L <- function(x, k = 1) lag(x, -k)

# predict 1 ahead each iteration
for(i in 7:10) {
   # fit based on first i-1 values
   fit <- dyn$lm(Y ~ L(Y) + z + L(x, 0:1), tz, subset = seq_len(i-1))
   # get prediction for ith value
   tz[i, "Y"] <- tail(predict(fit, tz[1:i,]), 1)
}
cbind(pred = tz[7:10, "Y"], act = tz.orig[7:10, "Y"])





