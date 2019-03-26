library(SPECIES)


### Name: pnpmle
### Title: Penalized conditional NPML estimator for species richness
### Aliases: pnpmle

### ** Examples

library(SPECIES)

##load data from the package, 
## \dQuote{butterfly} is the famous butterfly data by Fisher 1943.
#data(butterfly)

##output estimate without confidence interval using cutoff t=15
#pnpmle(butterfly,t=15,C=0)

##output estimate with confidence interval using cutoff t=15
#pnpmle(butterfly,t=15,C=1, b=200)




