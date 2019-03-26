## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  fig.width  = 7,
  fig.height = 4,
  fig.align  = "center",
#  cache      = TRUE,
  autodep    = TRUE
)

## ------------------------------------------------------------------------
library(Synth)
data(synth.data)
dataprep.out <-
  dataprep(
    foo = synth.data,
    predictors = c("X1", "X2", "X3"),
    predictors.op = "mean",
    dependent = "Y",
    unit.variable = "unit.num",
    time.variable = "year",
    special.predictors = list(
      list("Y", 1991, "mean"),
      list("Y", 1985, "mean"),
      list("Y", 1980, "mean")
    ),
    treatment.identifier = 7,
    controls.identifier = c(29, 2, 13, 17, 32, 38),
    time.predictors.prior = c(1984:1989),
    time.optimize.ssr = c(1984:1990),
    unit.names.variable = "name",
    time.plot = 1984:1996
  )

synth.out <- synth(dataprep.out)

## ------------------------------------------------------------------------
library(MSCMT)
synth2.out <- improveSynth(synth.out,dataprep.out)

## ------------------------------------------------------------------------
if (file.exists("synth3.out.RData")) load ("synth3.out.RData") else {
  set.seed(42)
  out <- capture.output(synth3.out <- synth(dataprep.out,genoud=TRUE))
}  

## ------------------------------------------------------------------------
synth4.out <- improveSynth(synth3.out,dataprep.out)

