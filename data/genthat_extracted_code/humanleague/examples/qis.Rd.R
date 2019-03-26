library(humanleague)


### Name: qis
### Title: Multidimensional QIS
### Aliases: qis

### ** Examples

ageByGender = array(c(1,2,5,3,4,3,4,5,1,2), dim=c(5,2))
ethnicityByGender = array(c(4,6,5,6,4,5), dim=c(3,2))
result = qis(list(c(1,2), c(3,2)), list(ageByGender, ethnicityByGender))



