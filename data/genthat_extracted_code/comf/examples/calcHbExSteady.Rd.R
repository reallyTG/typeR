library(comf)


### Name: calcHbExSteady
### Title: Calculates Human Body Exergy Consumption Rate Using Steady State
###   Method
### Aliases: calcHbExSteady HbExSteady HBxst hbxst
### Keywords: manip

### ** Examples

## Calculation of human body exergy consumption rate
calcHbExSteady(22, 24, 50, .1, .8, 1.2, 5, 80)

## Calculation of multiple values
dfData <- data.frame(ta=c(20:25), tr=c(20:25))
dfResult <- calcHbExSteady(22, 24, 50, .1, .8, 1.2, 5, 80) 
for(i in 1:nrow(dfData)){
dfResult[i,] <- calcHbExSteady(dfData$ta[i], dfData$tr[i], 50, .1, .5, 1.1, 5, 80)
}





