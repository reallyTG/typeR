## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
library(EmpiricalCalibration)

## ------------------------------------------------------------------------
data(southworthReplication)

## ------------------------------------------------------------------------
outcomeOfInterest <- southworthReplication[is.na(southworthReplication$trueLogRr), ]
outcomeOfInterest
computeTraditionalCi(outcomeOfInterest$logRr, outcomeOfInterest$seLogRr)

## ------------------------------------------------------------------------
negatives <- southworthReplication[southworthReplication$trueLogRr == 0 &
                                     !is.na(southworthReplication$trueLogRr), ]
head(negatives)

## ------------------------------------------------------------------------
data(southworthReplication)
positives <- southworthReplication[southworthReplication$trueLogRr != 0 &
                                     !is.na(southworthReplication$trueLogRr), ]
head(positives)

## ----fig.height=7--------------------------------------------------------
controls <- southworthReplication[!is.na(southworthReplication$trueLogRr), ]
plotTrueAndObserved(controls$logRr, controls$seLogRr, controls$trueLogRr)

## ------------------------------------------------------------------------
model <- fitSystematicErrorModel(controls$logRr, controls$seLogRr, controls$trueLogRr)
model

## ------------------------------------------------------------------------
plotErrorModel(controls$logRr, controls$seLogRr, controls$trueLogRr)

## ----fig.width=13, fig.height=2.8, out.width="100%"----------------------
plotCiCalibrationEffect(controls$logRr, controls$seLogRr, controls$trueLogRr)

## ------------------------------------------------------------------------
plotCiCoverage(controls$logRr,
               controls$seLogRr,
               controls$trueLogRr,
               crossValidationGroup = controls$outcomeName)

## ------------------------------------------------------------------------
ci <- calibrateConfidenceInterval(outcomeOfInterest$logRr, outcomeOfInterest$seLogRr, model)
ci
exp(ci[,1:3])

## ----tidy=TRUE,evale=TRUE------------------------------------------------
citation("EmpiricalCalibration")

