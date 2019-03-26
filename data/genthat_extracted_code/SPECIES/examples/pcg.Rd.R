library(SPECIES)


### Name: pcg
### Title: Poisson-compound Gamma estimator for the species richness
### Aliases: pcg

### ** Examples

library(SPECIES)
##load data from the package, 
## \dQuote{butterfly} is the famous butterfly data by Fisher 1943.

data(butterfly)

##output estimate without confidence interval using cutoff t=15
##pcg(butterfly,t=20,C=0,alpha=c(1:10))

##output estimate with confidence interval using cutoff t=15
#pcg(butterfly,t=20,C=1,alpha=c(1:10),b=200)



