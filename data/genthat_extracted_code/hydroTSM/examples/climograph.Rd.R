library(hydroTSM)


### Name: climograph
### Title: Climograph
### Aliases: climograph
### Keywords: manip

### ** Examples

######################
## Ex1: Loading the DAILY precipitation, maximum and minimum air temperature at 
##      station Maquehue Temuco Ad (Chile)
data(MaquehueTemuco)
pcp <- MaquehueTemuco[, 1]
tmx <- MaquehueTemuco[, 2]
tmn <- MaquehueTemuco[, 3]

## Plotting the climograph
m <- climograph(pcp=pcp, tmx=tmx, tmn=tmn, na.rm=TRUE)




