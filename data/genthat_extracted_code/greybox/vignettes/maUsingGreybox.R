## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align="center",
  fig.height=4,
  fig.width=6
)

library(greybox)

## ----data----------------------------------------------------------------
mtcarsData <- as.data.frame(mtcars)
mtcarsData$vs <- factor(mtcarsData$vs, levels=c(0,1), labels=c("v","s"))
mtcarsData$am <- factor(mtcarsData$am, levels=c(0,1), labels=c("a","m"))

## ----cramerVSAM----------------------------------------------------------
cramer(mtcarsData$vs, mtcarsData$am)

## ----cramerGearAM--------------------------------------------------------
cramer(mtcarsData$am, mtcarsData$gear)

## ----barplot-------------------------------------------------------------
plot(table(mtcarsData$am,mtcarsData$gear))

## ----tableplot-----------------------------------------------------------
tableplot(mtcarsData$am,mtcarsData$gear)

## ----table---------------------------------------------------------------
table(mtcarsData$am,mtcarsData$gear) / length(mtcarsData$am)

## ----mcor----------------------------------------------------------------
mcor(mtcarsData$am,mtcarsData$mpg)

## ----assoc---------------------------------------------------------------
assocValues <- assoc(mtcarsData)
print(assocValues,digits=2)

## ----scatterplot---------------------------------------------------------
plot(mtcarsData)

## ----spread--------------------------------------------------------------
spread(mtcarsData)

## ----spreadHist----------------------------------------------------------
spread(mtcarsData, histograms=TRUE, log=TRUE)

## ----determ--------------------------------------------------------------
determination(mtcarsData[,-1])

