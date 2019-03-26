library(pairwise)


### Name: kft5
### Title: Dichotomous example data in Rost 2004
### Aliases: kft5
### Keywords: datasets

### ** Examples

data(kft5)
dim(kft5)
###########
# frequencies
ftab(kft5)
# Itemparameter to be compared with Rost (2004), page 120.
summary(pair(kft5)) 
# Itemparameter to be compared with Rost (2004), page 120.
summary(pers(pair(kft5))) 



