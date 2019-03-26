## ---- echo = FALSE, message = FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width = 120, max.print = 5)
library(ArchaeoPhases)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KADatesChronoModel")
TempoPlot(KADatesChronoModel, c(2:17), level = 0.95, newWindow= FALSE)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KADatesChronoModel")
TempoActivityPlot(KADatesChronoModel, c(2:17), level = 0.95, newWindow= FALSE)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KADatesChronoModel")
OccurrencePlot(KADatesChronoModel, c(2:17), level = 0.95, newWindow= FALSE)

