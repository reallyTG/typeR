## ----setup, include=FALSE, eval=TRUE-------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(FossilSim)
if(!require(paleotree)) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
record = paleotree::simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1, nTotalTaxa = c(30,40),
                                    nExtant = 0, nSamp = c(5,25))

converted_record = paleotree.record.to.fossils(record = record)
converted_record

## ------------------------------------------------------------------------
converted_record$tree$origin.time

## ------------------------------------------------------------------------
t = ape::rtree(6)
f = sim.fossils.poisson(rate = 2, tree = t)

converted_record = fossils.to.paleotree.record(fossils = f, tree = t)
converted_record

