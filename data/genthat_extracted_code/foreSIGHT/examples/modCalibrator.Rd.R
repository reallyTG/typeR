library(foreSIGHT)


### Name: modCalibrator
### Title: modCalibrator
### Aliases: modCalibrator
### Keywords: functions

### ** Examples

data(tankDat)                               #Load tank data (tank_obs)
modelTag=c("P-ann-wgen","Temp-har26-wgen")  #Select a rainfall and a temperature generator
out<- modCalibrator(obs = tank_obs,         #Calibrate models
                    modelTag = modelTag)



