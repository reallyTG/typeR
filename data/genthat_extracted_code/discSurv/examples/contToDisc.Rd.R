library(discSurv)


### Name: contToDisc
### Title: Continuous to Discrete Transformation
### Aliases: contToDisc
### Keywords: datagen

### ** Examples

# Example copenhagen stroke study data
library(pec)
data(cost)
head(cost)

# Convert observed times to months
# Right borders of intervals [0, a_1), [a_1, a_2), ... , [a_{\max-1}, a_{\max})
IntBorders <- 1:ceiling(max(cost$time)/30)*30

# Select subsample
subCost <- cost [1:100, ]
CostMonths <- contToDisc (dataSet=subCost, timeColumn="time", intervalLimits=IntBorders)
head(CostMonths)

# Select subsample giving number of equidistant intervals
CostMonths <- contToDisc (dataSet=subCost, timeColumn="time", intervalLimits=10, equi=TRUE)
head(CostMonths)



