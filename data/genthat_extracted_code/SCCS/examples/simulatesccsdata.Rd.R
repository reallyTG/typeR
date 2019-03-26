library(SCCS)


### Name: simulatesccsdata
### Title: Simulation of SCCS data
### Aliases: simulatesccsdata

### ** Examples


# Simulate data where all the cases have same start and end of 
# observation periods and no age effect 

set.seed(4321)

arisk <- round(runif(110,366,730)) # ages at start of exposure

simdata <- simulatesccsdata(nindivs=110, astart=366, aend=730,
                            adrug=arisk, aedrug=arisk+20, eexpo=2.5)
                            

simdata



