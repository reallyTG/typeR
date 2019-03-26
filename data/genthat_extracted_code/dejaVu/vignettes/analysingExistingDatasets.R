## ----load,message=FALSE--------------------------------------------------
library(dejaVu)

## ------------------------------------------------------------------------
summary(simData)

## ------------------------------------------------------------------------
#analyse observed data
library(MASS)
obsMod <- glm.nb(y~z+offset(log(fupTime)), data=simData)
summary(obsMod)

## ------------------------------------------------------------------------
covar.df <- data.frame(id=1:dim(simData)[1], z=simData$z)
dejaData <- MakeDejaData(covar.df, arm="z", Id="id")

## ------------------------------------------------------------------------
eventTimes <- expandEventCount(count = simData$y, time = simData$fupTime)

## ------------------------------------------------------------------------
obsData <-
  ImportSim(
  dejaData,
  event.times = eventTimes,
  status = "dropout",
  study.time = 1,
  censored.time = simData$fupTime,
  allow.beyond.study = T
  )

## ------------------------------------------------------------------------
obsFit <- Simfit(obsData,equal.dispersion=TRUE)

## ------------------------------------------------------------------------
imputed.data.sets <- Impute(fit = obsFit,impute.mechanism = weighted_j2r(trt.weight=0),
                              N=10)

## ------------------------------------------------------------------------
fitted <- Simfit(imputed.data.sets,family="negbin")
summary(fitted)

