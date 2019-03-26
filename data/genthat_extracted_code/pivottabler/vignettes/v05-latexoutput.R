## ---- message=FALSE, warning=FALSE, comment="", echo=FALSE---------------
s <- "\\documentclass{article}\n\\begin{document}\nHello World!\n\\end{document}"
cat(s)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()

## ---- message=FALSE, warning=FALSE, comment=""---------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
cat(pt$getLatex())

## ---- eval=FALSE---------------------------------------------------------
#  library(pivottabler)
#  cat(qlpvt(bhmtrains, "TOC", "TrainCategory", c("TotalTrains"="n()")))

