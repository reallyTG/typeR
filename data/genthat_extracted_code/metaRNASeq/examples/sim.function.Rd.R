library(metaRNASeq)


### Name: sim.function
### Title: Simulation of multiple RNA-seq experiments
### Aliases: sim.function extractfromsim
### Keywords: methods

### ** Examples

## Load simulation parameters
data(param)
data(dispFuncs)

## Simulate data
matsim <- sim.function(param = param, dispFuncs = dispFuncs)
sim.conds <- colnames(matsim)
rownames(matsim) <-paste("tag", 1:dim(matsim)[1],sep="")

# extract simulated data from one study
simstudy1 <- extractfromsim(matsim,"study1")
head(simstudy1$study)
simstudy1$pheno



