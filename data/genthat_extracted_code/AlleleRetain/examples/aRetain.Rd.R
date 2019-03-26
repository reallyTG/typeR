library(AlleleRetain)


### Name: aRetain
### Title: Allele Retention, Inbreeding, and Demography
### Aliases: aRetain

### ** Examples


## Simulate rare allele with frequency 0.05 in source population.
## 20 individuals are translocated to establish a new population with carrying 
## capacity = 100 individuals.  An additional 5 individuals are translocated 
## once every 10 years as immigrants. Demographic parameter values are for a 
## monogamous passerine bird species with a 5-yr average lifespan.  Only 30 
## iterations are run so the confidence intervals will be wide.

## Not run: 
##D 
##D aR.temp <- aRetain(q0 = 0.05, sourceN = 2000, startN = 20, startAge = 
##D "adult", startSR = 0.5, exactSSR = FALSE, inisurv = 0.90, addN = 0, addyrs 
##D = c(0),  migrN = 5, migrfreq = 10, mpriority = FALSE, removeL = FALSE, K = 
##D 100, KAdults = FALSE, mature = 1, matingSys = "monogamy", matingLength = 
##D "seasonal", retainBreeders = "male", MaxAge = 16, SenesAge = 5, adsurvivalF = 
##D 0.77, adsurvivalM = 0.77, nonbrsurv = 0.70, nonbrsurvK = 0.40, juvsurv = 0.60,  
##D juvsurvK = 0.30, youngperF = 2.85, SDypF = 1.25, MAXypF = 6, MAXypFK = 6, 
##D ypFsex = "female", youngSR = 0.5, trackall = TRUE, GeneCount = "all", nyears = 
##D 10, nrepl = 20, nreplprint = 10)
##D 
##D aRetain.summary(aR.temp,  GeneCount = "all", alpha=0.05, dropextinct = TRUE)
##D 
## End(Not run)




