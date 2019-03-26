library(unmarked)


### Name: occuRN
### Title: Fit the occupancy model of Royle and Nichols (2003)
### Aliases: occuRN
### Keywords: models

### ** Examples


## Not run: 
##D 
##D data(birds)
##D woodthrushUMF <- unmarkedFrameOccu(woodthrush.bin)
##D # survey occasion-specific detection probabilities
##D (fm.wood.rn <- occuRN(~ obsNum ~ 1, woodthrushUMF))
##D 
##D # Empirical Bayes estimates of abundance at each site
##D re <- ranef(fm.wood.rn)
##D plot(re)
##D 
##D 
## End(Not run)




