## ----loadKnitr, echo=FALSE-----------------------------------------------
library("knitr")
# opts_chunk$set(eval=FALSE)
library(pander)
panderOptions("digits", 3)
set.seed(18090212)
library(shiftR)

## ----generateData--------------------------------------------------------
n = 1e6

sim = simulateBinary(n, corWithin = 0.99, corAcross = 0)

offsets = getOffsetsUniform(n = n, npermute = 10e3)
perm = shiftrPermBinary( sim$data1, sim$data2, offsets)

message("Fisher exact test p-value: ", perm$fisherTest$p.value)
message("Permutation p-value: ", perm$permPV)

## ----seed2, echo=FALSE---------------------------------------------------
set.seed(18090212)

## ----genPV---------------------------------------------------------------
n = 1e6
sim = simulatePValues(n, corWithin = 0.99, corAcross = 0)

## ----pvfish--------------------------------------------------------------
fisher.test(sim$data1 < 0.10, sim$data2 < 0.10)$p.value

## ----enr-----------------------------------------------------------------
enr = enrichmentAnalysis(
    sim$data1,
    sim$data2,
    percentiles1 = c(0.01, 0.05, 0.10),
    percentiles2 = c(0.01, 0.05, 0.10),
    npermute = 10e3,
    threads = 2)

message('Enrichment p-value is: ', enr$overallPV[2])

