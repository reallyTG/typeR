library(briskaR)


### Name: ecoToxic
### Title: EcoToxicological model method
### Aliases: ecoToxic ecoToxic,Landscape,Individuals-method
###   ecotoxicological-method

### ** Examples

## Not run: 
##D data(maize_65)
##D # Calculation of toxic internal concentration of individuals :
##D res <- ecoToxic(alandscape, anindividuals, atoxicintensity,
##D  mintime=1, maxtime=60, kin=0.25, kout=0.5, deltat=0.1)
##D # time series of toxic internal concentration for the 1st individual:
##D plot(alandscape, res, numind=1)
##D # Simulate pollen dispersion
##D tox <- toxicIntensity(maize.landscape,maize.emitted_pollen,1,61)
##D # Simulate ecotoxicological for individuals plot ecotoxicology of individual 1.
##D ind2<-ecoToxic(maize.landscape,maize.individuals,objectT=tox,maxtime=61)
##D # draw result for individual 1.
##D plot(maize.landscape,ind2,objectT=tox,numind=1)
## End(Not run)




