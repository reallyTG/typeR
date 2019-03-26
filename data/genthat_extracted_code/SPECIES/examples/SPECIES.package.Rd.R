library(SPECIES)


### Name: SPECIES-package
### Title: An R pacakge for species richness estimation
### Aliases: SPECIES-package SPECIES

### ** Examples

##load library
library(SPECIES)

## "butterfly" is the famous butterfly data by Fisher 1943.

data(butterfly)

##jackknife method
jackknife(butterfly,k=5)

##using only 'ACE' coverage method
ChaoLee1992(butterfly,t=10, method="all")

##using chao1984 lower bound estimator
chao1984(butterfly)

##using Chao and Bunge coverage-duplication method
ChaoBunge(butterfly,t=10)

##penalized NPMLE method
#pnpmle(butterfly,t=15,C=1,b=200)

##unconditonal NPMLE method
#unpmle(butterfly,t=10,C=1,b=200)

##Poisson-compound Gamma method
#pcg(butterfly,t=20,C=1,b=200)



