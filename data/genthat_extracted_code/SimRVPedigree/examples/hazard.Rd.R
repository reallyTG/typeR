library(SimRVPedigree)


### Name: hazard
### Title: Create an object of class hazard.
### Aliases: hazard

### ** Examples

data(AgeSpecific_Hazards)

head(AgeSpecific_Hazards)
nrow(AgeSpecific_Hazards)

my_part = seq(0, 100, by = 1)
my_HR <- hazard(hazardDF = AgeSpecific_Hazards,
                partition = my_part)


my_HR
class(my_HR)
head(my_HR[[1]])
my_HR[[2]]


my_HR <- hazard(hazardDF = AgeSpecific_Hazards)
class(my_HR)
my_HR[[2]]




