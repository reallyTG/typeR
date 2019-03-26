library(qrnn)


### Name: YVRprecip
### Title: Daily precipitation data at Vancouver Int'l Airport (YVR)
### Aliases: YVRprecip
### Keywords: datasets

### ** Examples

## YVR precipitation data with seasonal cycle and NCEP/NCAR Reanalysis
## covariates

data(YVRprecip)
y <- YVRprecip$precip
x <- cbind(sin(2*pi*seq_along(y)/365.25),
           cos(2*pi*seq_along(y)/365.25),
           YVRprecip$ncep)

## Fit QRNN and quantile regression models for the conditional 75th
## percentile using the final 3 years of record for training and the
## remaining years for testing.
train <- as.numeric(format(YVRprecip$date, "%Y")) >= 1998
test <- !train

set.seed(1)
w.qrnn <- qrnn.fit(x=x[train,], y=y[train,,drop=FALSE],
                   n.hidden=1, tau=0.75, iter.max=200,
                   n.trials=1, lower=0)
p.qrnn <- qrnn.predict(x=x[test,], parms=w.qrnn)
w.qreg <- qrnn.fit(x=x[train,], y=y[train,,drop=FALSE],
                   tau=0.75, n.trials=1, lower=0,
                   Th=linear, Th.prime=linear.prime)
p.qreg <- qrnn.predict(x=x[test,], parms=w.qreg)

## Tilted absolute value cost function on test dataset
qvs.qrnn <- mean(tilted.abs(y[test]-p.qrnn, 0.75))
qvs.qreg <- mean(tilted.abs(y[test]-p.qreg, 0.75))
cat("Cost QRNN", qvs.qrnn, "\n")
cat("Cost QREG", qvs.qreg, "\n")

## Plot first year of test dataset
plot(y[test][1:365], type="h", xlab="Day", ylab="Precip. (mm)")
points(p.qrnn[1:365], col="red", pch=19)
points(p.qreg[1:365], col="blue", pch=19)




