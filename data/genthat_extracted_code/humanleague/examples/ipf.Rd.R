library(humanleague)


### Name: ipf
### Title: Multidimensional IPF
### Aliases: ipf

### ** Examples

ageByGender = array(c(1,2,5,3,4,3,4,5,1,2), dim=c(5,2))
ethnicityByGender = array(c(4,6,5,6,4,5), dim=c(3,2))
seed = array(rep(1,30), dim=c(5,2,3))
result = ipf(seed, list(c(1,2), c(3,2)), list(ageByGender, ethnicityByGender))



