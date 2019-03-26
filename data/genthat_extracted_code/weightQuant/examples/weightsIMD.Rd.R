library(weightQuant)


### Name: weightsIMD
### Title: Estimation of observation-specific weights with intermittent
###   missing data
### Aliases: weightsIMD

### ** Examples

w_simdata <- weightsIMD(data=simdata,Y="Y",X1="X",X2=NULL,subject="id",
death="death",time="time",impute=20,name="w_imd")$data



