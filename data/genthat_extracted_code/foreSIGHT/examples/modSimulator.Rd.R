library(foreSIGHT)


### Name: modSimulator
### Title: modSimulator
### Aliases: modSimulator
### Keywords: functions

### ** Examples

## Not run: 
##D data(tankDat); obs=tank_obs                     #Get observed data
##D modelTag=c("P-har12-wgen","Temp-har26-wgen")    #Select models
##D pars=modCalibrator(obs=obs,modelTag=modelTag)   #Calibrate models
##D sim=modSimulator(datStart="1970-01-01",         #Simulate!
##D                  datFinish="1999-12-31",
##D                  modelTag=modelTag,
##D                  parS=pars,
##D                  seed=123,
##D                  file=paste0("tester.csv"),
##D                  IOmode="verbose")
##D plot(sim$P[1:365])                             #Plot first year of rainfall
## End(Not run)



