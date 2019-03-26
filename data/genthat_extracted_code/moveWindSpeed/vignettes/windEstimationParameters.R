## ---- echo=FALSE---------------------------------------------------------
set.seed(3425)

## ------------------------------------------------------------------------
require("moveWindSpeed")

## ------------------------------------------------------------------------
data <- storks[[1]]

## ------------------------------------------------------------------------
windowSize <- 29

## ------------------------------------------------------------------------
tdiffs <- diff(as.numeric(timestamps(data)))
quantile(tdiffs, c(0.01, 0.1, 0.5, 0.9, 0.99))

## ------------------------------------------------------------------------
isSamplingRegular <- 1

## ------------------------------------------------------------------------
isThermallingFunction <- getDefaultIsThermallingFunction(360, 4)

## ------------------------------------------------------------------------
maxPointsToUseInEstimate <- 25

## ------------------------------------------------------------------------
estimationResult <- estimatePhi(data, isSamplingRegular=isSamplingRegular, windowSize=windowSize, isThermallingFunction=isThermallingFunction, maxPointsToUseInEstimate=maxPointsToUseInEstimate, phiInitialEstimate=0, returnPointsUsedInEstimate=T)

## ------------------------------------------------------------------------
estimationResult$phi
estimationResult$n

## ------------------------------------------------------------------------
oo <- lapply(1:nrow(data), '+', (-(windowSize-1)/2):((windowSize-1)/2))[estimationResult$isPointUsedInEstimate]
oo <- oo[1:min(length(oo), maxPointsToUseInEstimate)]
op <- par(mfrow=c(4,6), mar=rep(0.5, 4))
# Plot track segments
tmp <- lapply(oo, function(ooo) plot(data[(ooo)], typ='b', xlab=NA, ylab=NA, axes=F))
par(op)

## ------------------------------------------------------------------------
isFocalPoint<-function(i, ts) i%%windowSize==0

## ------------------------------------------------------------------------
phi <- estimationResult$phi
windEst <- getWindEstimates(data, isSamplingRegular=isSamplingRegular, windowSize=windowSize, isThermallingFunction=isThermallingFunction, phi=phi, isFocalPoint=isFocalPoint)
names(windEst)

## ------------------------------------------------------------------------
windEst2 <- windEst[!is.na(windEst$estimationSuccessful),]

## ------------------------------------------------------------------------
windSpeed <-sqrt(windEst2$windX^2+windEst2$windY^2)
plot(timestamps(windEst2), windSpeed)

## ------------------------------------------------------------------------
hist(sqrt(windEst2$windVarMax), breaks=seq(0,1,0.1))

## ------------------------------------------------------------------------
phis <- seq(.01, .99, by = .01)
ll <-
  unlist(lapply(phis, function(x, ...) {
    windEstimLogLik(getWindEstimates(phi = x, ...)$residualVarAirspeed, x)
  }, data = estimationResult$segments))
plot(phis, ll, type='l', xlab="Phi", ylab="Log Likelihood")

