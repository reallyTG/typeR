library(refund)


### Name: smooth.construct.pco.smooth.spec
### Title: Principal coordinate ridge regression
### Aliases: smooth.construct.pco.smooth.spec pco Predict.matrix.pco.smooth
###   poridge

### ** Examples

# a simulated example
library(refund)
library(mgcv)
require(dtw)

## First generate the data
Xnl <- matrix(0, 30, 101)
set.seed(813)
tt <- sort(sample(1:90, 30))
for(i in 1:30){
  Xnl[i, tt[i]:(tt[i]+4)] <- -1
  Xnl[i, (tt[i]+5):(tt[i]+9)] <- 1
}
X.toy <- Xnl + matrix(rnorm(30*101, ,0.05), 30)
y.toy <- tt + rnorm(30, 0.05)
y.rainbow <- rainbow(30, end=0.9)[(y.toy-min(y.toy))/
                                   diff(range(y.toy))*29+1]

## Display the toy data
par(mfrow=c(2, 2))
matplot((0:100)/100, t(Xnl[c(4, 25), ]), type="l", xlab="t", ylab="",
        ylim=range(X.toy), main="Noiseless functions")
matplot((0:100)/100, t(X.toy[c(4, 25), ]), type="l", xlab="t", ylab="",
        ylim=range(X.toy), main="Observed functions")
matplot((0:100)/100, t(X.toy), type="l", lty=1, col=y.rainbow, xlab="t",
        ylab="", main="Rainbow plot")

## Obtain DTW distances
D.dtw <- dist(X.toy, method="dtw", window.type="sakoechiba", window.size=5)

## Compare PC vs. PCo ridge regression

# matrix to store results
GCVmat <- matrix(NA, 15, 2)
# dummy response variable
dummy <- rep(1,30)

# loop over possible projection dimensions
for (k. in 1:15){
  # fit PC (m1) and PCo (m2) ridge regression
  m1 <- gam(y.toy ~ s(dummy, bs="pco", k=k.,
            xt=list(realdata=X.toy, dist_fn=dist)), method="REML")
  m2 <- gam(y.toy ~ s(dummy, bs="pco", k=k., xt=list(D=D.dtw)), method="REML")
  # calculate and store GCV scores
  GCVmat[k., ] <- length(y.toy) * c(sum(m1$residuals^2)/m1$df.residual^2,
                   sum(m2$residuals^2)/m2$df.residual^2)
}

## plot the GCV scores per dimension for each model
matplot(GCVmat, lty=1:2, col=1, pch=16:17, type="o", ylab="GCV",
        xlab="Number of principal components / coordinates",
        main="GCV score")
legend("right", c("PC ridge regression", "DTW-based PCoRR"), lty=1:2, pch=16:17)

## example of making a prediction

# fit a model to the toy data
m <- gam(y.toy ~ s(dummy, bs="pco", k=2, xt=list(D=D.dtw)), method="REML")

# first build the distance matrix
# in this case we just subsample the original matrix
# see ?pco_predict_preprocess for more information on formatting this data
dist_list <- list(dummy = as.matrix(D.dtw)[, c(1:5,10:15)])

# preprocess the prediction data
pred_data <- pco_predict_preprocess(m, newdata=NULL, dist_list)

# make the prediction
p <- predict(m, pred_data)

# check that these are the same as the corresponding fitted values
print(cbind(fitted(m)[ c(1:5,10:15)],p))



