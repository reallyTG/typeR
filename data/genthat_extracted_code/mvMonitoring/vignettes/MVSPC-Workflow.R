## ---- message = FALSE----------------------------------------------------
library(mvMonitoring)
fault1A_xts <- mspProcessData(faults = "A1",
                              period = 7 * 24 * 60,
                              faultStartIndex = 8500,
                              startTime = "2015-05-16 10:00:00 CST")

str(fault1A_xts)

## ------------------------------------------------------------------------
train1A_xts <- fault1A_xts[1:8461,]
# This function will run in 13 seconds on the author's machine.
train1A_ls <- mspTrain(data = train1A_xts[,-1],
                       labelVector = train1A_xts[,1],
                       trainObs = 3 * 24 * 60,
                       updateFreq = 1 * 24 * 60,
                       Dynamic = TRUE,
                       lagsIncluded = 0:1,
                       faultsToTriggerAlarm = 5)

## ---- message = FALSE----------------------------------------------------
library(xts)
test1A_xts <- fault1A_xts[8460:8520, -1]
lagTest1A_xts <- lag.xts(test1A_xts, 0:1)
lagTest1A_xts <- cbind(fault1A_xts[8461:8520,1],
                       lagTest1A_xts[-1,])
head(lagTest1A_xts)

## ------------------------------------------------------------------------
monitor1A_xts <- mspMonitor(observations = lagTest1A_xts[,-1],
                            labelVector = lagTest1A_xts[,1],
                            trainingSummary = train1A_ls$TrainingSpecs)
head(monitor1A_xts)

## ------------------------------------------------------------------------
alarm1A_xts <- monitor1A_xts
for(i in 1:nrow(alarm1A_xts)){
  if(i < (5 + 1)){
    alarm1A_xts[1:i,] <- mspWarning(alarm1A_xts[1:i,])
  }else{
    alarm1A_xts[(i - 5):i,] <- mspWarning(alarm1A_xts[(i - 5):i,])
  }
}

## ---- fig.width = 5, out.width = '100%'----------------------------------
plot(alarm1A_xts[, ncol(alarm1A_xts)],
     main = "Alarm Codes for Test Data")

