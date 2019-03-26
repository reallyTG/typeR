library(poppr)


### Name: poppr.amova
### Title: Perform Analysis of Molecular Variance (AMOVA) on genind or
###   genclone objects.
### Aliases: poppr.amova amova
### Keywords: amova

### ** Examples

data(Aeut)
strata(Aeut) <- other(Aeut)$population_hierarchy[-1]
agc <- as.genclone(Aeut)
agc
amova.result <- poppr.amova(agc, ~Pop/Subpop)
amova.result
amova.test <- randtest(amova.result) # Test for significance
plot(amova.test)
amova.test

## Not run: 
##D 
##D # You can get the same results with the pegas implementation
##D amova.pegas <- poppr.amova(agc, ~Pop/Subpop, method = "pegas")
##D amova.pegas
##D amova.pegas$varcomp/sum(amova.pegas$varcomp)
##D 
##D # Clone correction is possible
##D amova.cc.result <- poppr.amova(agc, ~Pop/Subpop, clonecorrect = TRUE)
##D amova.cc.result
##D amova.cc.test <- randtest(amova.cc.result)
##D plot(amova.cc.test)
##D amova.cc.test
##D 
##D 
##D # Example with filtering
##D data(monpop)
##D splitStrata(monpop) <- ~Tree/Year/Symptom
##D poppr.amova(monpop, ~Symptom/Year) # gets a warning of zero distances
##D poppr.amova(monpop, ~Symptom/Year, filter = TRUE, threshold = 0.1) # no warning
##D 
##D 
## End(Not run)



