library(makeFlow)


### Name: makeFlow-package
### Title: Visualizing Sequential Classifications
### Aliases: makeFlow-package
### Keywords: package hplot

### ** Examples

##  Data:
##  carData <- mtcars
##  carData$car <- "All Cars"
##  carData$speedclass <- ifelse(carData$qsec < 15, "Fast",
##                          ifelse(carData$qsec < 18, "Mid-Speed","Slow"))
##  carData$speedclass <- factor(x = carData$speedclass, levels = c("Slow","Mid-Speed","Fast"))
##  
##  Create Diagram:
##  makeFlow(data = carData, classFields = c("car","cyl","speedclass"),
##    gateWidth = 20, minVerticalBtwnGates = .15, distanceBtwnGates = 70,
##    fieldLabels = c("", "Cylinders","Speed"), gateBorder = "black")

##  Generate underlying tables using GateSummaries() and FlowSummaries()



