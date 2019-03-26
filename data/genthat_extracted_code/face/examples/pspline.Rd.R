library(face)


### Name: pspline
### Title: Univariate P-spline smoothing
### Aliases: pspline
### Keywords: ~Pspline

### ** Examples

## cd4 data
require(refund)
data(cd4)
n <- nrow(cd4)
T <- ncol(cd4)

id <- rep(1:n,each=T)
t <- rep(-18:42,times=n)
y <- as.vector(t(cd4))
sel <- which(is.na(y))

## organize data
data <- data.frame(y=log(y[-sel]),
argvals = t[-sel],
subj = id[-sel])
data <- data[data$y>4.5,]

## smooth
fit <- pspline(data)

## plot
plot(data$argvals,fit$mu.new,type="p")

## prediction
pred <- predict(fit,quantile(data$argvals,c(0.2,0.6)))
pred



