## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(ERSA)

## ----eval=F--------------------------------------------------------------
#  f <- lm(Fertility ~ . , data = swiss)
#  exploreReg(f,swiss)

## ----echo=FALSE, out.width='100%'----------------------------------------
knitr::include_graphics('swiss.png')

## ------------------------------------------------------------------------
f <- lm(Fertility ~ . , data = swiss)
summary(f)

## ------------------------------------------------------------------------
drop1(f, test="F")

## ------------------------------------------------------------------------
anova(f)

## ----fig.width=4, fig.height=4, fig.align='center'-----------------------
plottStats(f)
cols <- termColours(f)
plottStats(f, cols)

## ----eval=F--------------------------------------------------------------
#  plotCIStats(f,cols)
#  plotCIStats(f, cols,stdunits=TRUE)
#  plotAnovaStats(f, cols,type="F")
#  plotAnovaStats(f, cols,type="SS")

## ----fig.width=6, fig.height=4-------------------------------------------
fr <- revPredOrd(f, swiss)
plotSeqSS(list(f,fr), cols,legend=TRUE)

## ----eval=F--------------------------------------------------------------
#  fselOrder(f)
#  bselOrder(f)
#  randomPredOrder(f)
#  regsubsetsOrder(f)

## ----fig.width=7,fig.height=4, fig.align='center'------------------------
pcpPlot(swiss, f)

## ----fig.width=7,fig.height=4,fig.align='center'-------------------------
pcpPlot(swiss, f, type="Residuals")

## ----fig.width=7, fig.height=4,fig.align='center'------------------------
pcpPlot(swiss, f, type="Hatvalues", sequential=T)

