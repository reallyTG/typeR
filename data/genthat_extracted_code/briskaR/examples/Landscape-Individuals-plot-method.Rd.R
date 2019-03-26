library(briskaR)


### Name: plot,Landscape,Individuals-method
### Title: plot Landscape & Individuals method
### Aliases: plot,Landscape,Individuals-method

### ** Examples

## Not run: 
##D data(maize_65)
##D # plot a landscape and individuals
##D plot(maize.landscape,maize.individuals)
##D # plot a landscape and individuals states at time 30
##D plot(maize.landscape,maize.individuals,time=30)
##D # Simulate pollen dispersion
##D tox <- toxicIntensity(maize.landscape,maize.emitted_pollen,1,61)
##D # plot a landscape, individuals and pollen dispersion of maize_65 data
##D plot(maize.landscape,maize.individuals,time=30,objectT=tox)
##D # plot ecotoxicology of individual 1.
##D ind2<-ecoToxic(maize.landscape,maize.individuals,objectT=tox,maxtime=61)
##D plot(maize.landscape,ind2,objectT=tox,numind=1)
## End(Not run)



