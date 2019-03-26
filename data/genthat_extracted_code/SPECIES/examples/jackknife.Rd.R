library(SPECIES)


### Name: jackknife
### Title: Jackknife estimator for the species richness
### Aliases: jackknife

### ** Examples


library(SPECIES)

##load data from the package, 
## "butterfly" is the famous tterfly data by Fisher 1943.

data(butterfly)
jackknife(butterfly,k=5)



