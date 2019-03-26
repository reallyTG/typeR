library(bimetallic)


### Name: bimetallic-package
### Title: Power for SNP analyses using silver standard cases
### Aliases: bimetallic-package bimetallic
### Keywords: package

### ** Examples

##Make a chisq simulator under a study scenario
sim = chisq.sim.factory(R = 4, gam_ca = 3, gam_co = 0,
	ppv = .8, npv = 1, homRR = 2.2, N_co = 1000,
	maf = .1, prev = .01, model = "mult")

##Run one realization of the simulation
sim()



