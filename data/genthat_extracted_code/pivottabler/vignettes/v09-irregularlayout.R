## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot(includeHeaderValues=TRUE, includeRCFilters=TRUE)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addColumnDataGroups("Status")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
cg1 <- pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
cg2 <- pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
cg1$addChildGroup(variableName="Status", values="A")
cg1$addChildGroup(variableName="Status", values="R")
cg2$addChildGroup(variableName="SchedSpeedMPH", values="100")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
cg1 <- pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
cg2 <- pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
cg1$addDataGroups("Status")
cg2$addDataGroups("SchedSpeedMPH")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
cgrps <- pt$addColumnDataGroups("PowerType")
add2Groups <- function(grp) {
  grp$addChildGroup(variableName="Status", values="A")
  grp$addChildGroup(variableName="Status", values="R")
}
invisible(lapply(cgrps, add2Groups))
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
cgrps <- pt$addColumnDataGroups("PowerType")
add2Groups <- function(grp) {
  if(!grp$isTotal) {
    grp$addChildGroup(variableName="Status", values="A")
    grp$addChildGroup(variableName="Status", values="R")
  }
}
invisible(lapply(cgrps, add2Groups))
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", caption="Count", summariseExpression="n()")
pt$defineCalculation(calculationName="MaxSpeedMPH", caption="Maximum Speed", summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
cg1 <- pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
cg2 <- pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$defineCalculation(calculationGroupName="calcGrp2", calculationName="MaxSpeedMPH", 
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
cg1$addCalculationGroups("default")
cg2$addCalculationGroups("calcGrp2")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
cg1 <- pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger", caption="Express Passenger (Count)")
cg2 <- pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU", caption="DMU (Maximum Speed")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$defineCalculation(calculationGroupName="calcGrp2", calculationName="MaxSpeedMPH", 
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
cg1$addCalculationGroups("default")
cg2$addCalculationGroups("calcGrp2")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
cg1 <- pt$columnGroup$addChildGroup(variableName="TrainCategory", values="Express Passenger")
cg2 <- pt$columnGroup$addChildGroup(variableName="PowerType", values="DMU")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$defineCalculation(calculationGroupName="calcGrp2", calculationName="MaxSpeedMPH", 
                     summariseExpression="max(SchedSpeedMPH, na.rm=TRUE)")
cg3 <- cg1$addChildGroup(caption="Count")
cg4 <- cg2$addChildGroup(caption="Maximum Speed")
cg3$addCalculationGroups("default")
cg4$addCalculationGroups("calcGrp2")
pt$renderPivot()

