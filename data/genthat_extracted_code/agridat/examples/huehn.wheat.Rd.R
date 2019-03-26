library(agridat)


### Name: huehn.wheat
### Title: Multi-environment trial of wheat to illustrate stability
###   statistics
### Aliases: huehn.wheat
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(huehn.wheat)
##D dat <- huehn.wheat
##D 
##D # Nassar & Huehn, p. 51 "there is no evidence for differences in stability
##D # among the 20 varieties".
##D require(gge)
##D m1 <- gge(yield ~ gen*env, dat)
##D biplot(m1, main="huehn.wheat")
##D 
##D require(reshape2)
##D datm <- acast(dat, gen~env, value.var='yield')
##D 
##D apply(datm,1,mean) # Gen means match Huehn 1979 table 1
##D apply(datm,2,mean) # Env means
##D apply(datm, 2, rank) # Ranks match Huehn table 1
##D 
##D # Huehn 1979 did not use genotype-centered data, and his definition
##D # of S2 is different from later papers.
##D if(require(stable)){
##D apply(huehn(datm, corrected=FALSE), 2, round,2) # S1 matches Huehn
##D ##          MeanRank   S1
##D ## Jubilar      6.70 3.62
##D ## Diplomat     8.35 5.61
##D ## Caribo      11.20 6.07
##D ## Cbc710      13.65 6.70
##D 
##D # Very close match to Nassar & Huehn 1987 table 4.
##D apply(huehn(datm, corrected=TRUE), 2, round,2)
##D ##          MeanRank   S1   Z1    S2   Z2
##D ## Jubilar      10.2 4.00 5.51 11.29 4.29
##D ## Diplomat     11.0 6.31 0.09 27.78 0.27
##D ## Caribo       10.6 6.98 0.08 34.49 0.01
##D ## Cbc710       10.9 8.16 1.78 47.21 1.73
##D }
##D 
## End(Not run)



