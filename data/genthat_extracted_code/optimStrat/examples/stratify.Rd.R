library(optimStrat)


### Name: stratify
### Title: Stratification of an Auxiliary Variable
### Aliases: stratify
### Keywords: survey

### ** Examples

x<- 1 + sort( rgamma(100, shape=4/9, scale=108) )
stratify(x, H=3)

set.seed(1280)
x<- 1 + sort( rgamma(100, shape=4/100, scale=1200) )
stratify(x, H=4) #Only three strata
stratify(x, H=4, forced=TRUE) #Four strata



