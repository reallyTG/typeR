library(discSurv)


### Name: dataCensoring
### Title: Data Censoring Transformation
### Aliases: dataCensoring
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

# Convert to long format based on months
CostMonthsLong <- dataLong (dataSet=CostMonths, timeColumn="timeDisc", censColumn="status")
head(CostMonthsLong, 20)

# Generate censoring process variable
CostMonthsCensor <- dataCensoring (dataSetLong=CostMonthsLong, respColumn="y", timeColumn="obj")
head(CostMonthsCensor)
tail(CostMonthsCensor [CostMonthsCensor$obj==1, ], 10)
tail(CostMonthsCensor [CostMonthsCensor$obj==3, ], 10)



