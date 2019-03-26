library(paleotree)


### Name: divCurveFossilRecordSim
### Title: Diversity-Curve Plotting for Simulations of Diversification and
###   Sampling In the Fossil Record
### Aliases: divCurveFossilRecordSim

### ** Examples


set.seed(44)
record <- simFossilRecord(p = 0.1, q = 0.1, r = 0.1, nruns = 1,
	nTotalTaxa = c(20,30) ,nExtant = 0, plot = FALSE)

# now let's plot it
divCurveFossilRecordSim(record)




