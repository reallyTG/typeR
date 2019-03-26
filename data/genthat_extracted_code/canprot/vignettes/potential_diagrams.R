## ----HTML, include=FALSE-------------------------------------------------
## some frequently used HTML expressions
# use lowercase here because these tend to be variable names in the examples
zc <- "<i>Z</i><sub>C</sub>"
h2o <- "H<sub>2</sub>O"

## ----options, echo=FALSE----------------------------------------------------------------
options(width = 90)

## ----canprot, message=FALSE-------------------------------------------------------------
library(canprot)
data(canprot)

## ----groupplots, fig.width=7, fig.height=7, fig.align="center", message=FALSE, results="hide"----
gpresult <- groupplots("pancreatic_H2O_up", res = 25)

## ----mergedplot, fig.width=5, fig.height=5, fig.align="center", message=FALSE-----------
mergedplot(gpresult, res = 25)

