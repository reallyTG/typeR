## ---- echo = FALSE, message = FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width = 120, max.print = 5)
library(ArchaeoPhases)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KAPhasesChronoModel")
MultiPhaseTimeRange(KAPhasesChronoModel, c(8,6,4,2), level = 0.95)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KAPhasesChronoModel")
MultiPhasePlot(KAPhasesChronoModel, c(8,6,4,2), level = 0.95)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KAPhasesChronoModel")
MultiPhasesTransition(KAPhasesChronoModel, c(8,6,4,2), level = 0.95)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KAPhasesChronoModel")
MultiPhasesGap(KAPhasesChronoModel, c(8,6,4,2), level = 0.95)

## ----fig.align='center',fig.width=6,fig.height=5----------------------------------------------------------------------
data("KAPhasesChronoModel")
MultiSuccessionPlot(KAPhasesChronoModel, c(8,6,4,2), level = 0.95)

