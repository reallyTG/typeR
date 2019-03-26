library(medflex)


### Name: expData-methods
### Title: Methods for expanded datasets
### Aliases: expData-methods residuals.expData residualPlot.expData
###   residualPlots.expData weights.expData

### ** Examples

data(UPBdata)

weightData <- neWeight(negaff ~ att + gender + educ + age, 
                       data = UPBdata, nRep = 2)

## extract regression weights for natural effect model
head(weights(weightData)) 

## assess normality
qqnorm(residuals(weightData))

## assess model adequacy
library(car)
residualPlots(weightData)



