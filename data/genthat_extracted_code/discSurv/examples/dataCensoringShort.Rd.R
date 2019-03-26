library(discSurv)


### Name: dataCensoringShort
### Title: Data Censoring Transformation for short formats
### Aliases: dataCensoringShort
### Keywords: datagen

### ** Examples

library(pec)
data(cost)
head(cost)
IntBorders <- 1:ceiling(max(cost$time)/30)*30
subCost <- cost [1:100, ]

# Convert from days to months
CostMonths <- contToDisc (dataSet=subCost, timeColumn="time", intervalLimits=IntBorders)
head(CostMonths)

# Generate censoring process variable in short format
CostMonthsCensorShort <- dataCensoringShort (dataSet=CostMonths, 
eventColumns="status", timeColumn="time")
head(CostMonthsCensorShort)



