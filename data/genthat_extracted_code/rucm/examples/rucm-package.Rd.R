library(rucm)


### Name: rucm
### Title: rucm: Functions to model and predict a time series using
###   Unobserved Components Model
### Aliases: rucm rucm-package

### ** Examples

modelNile <- ucm(Nile~0, data = Nile, 
irregular = TRUE, level = TRUE, slope = TRUE)

modelNile #Print the model

#Return smoothed level values
modelNile$s.level 

#Fixing the level variance to an absolute value
modelNile.fix <- ucm(Nile~0, data = Nile, 
irregular = TRUE, level = TRUE, level.var = 500, 
slope = TRUE) 

#Predicting future values of the time series
predict(modelNile.fix, n.ahead = 12) 





