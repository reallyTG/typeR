library(SPECIES)


### Name: unpmle
### Title: Unconditional NPML estimator for the SPECIES number
### Aliases: unpmle

### ** Examples

library(SPECIES)

##load data from the package, 
## "butterfly" is the famous butterfly data by Fisher 1943.

data(butterfly)


##output estimate without confidence interval using cutoff t=15
#unpmle(butterfly,t=15,C=0)

##output estimate with confidence interval using cutoff t=15
#unpmle(butterfly,t=15,C=1,b=200)




