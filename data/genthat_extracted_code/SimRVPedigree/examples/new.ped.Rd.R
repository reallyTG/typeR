library(SimRVPedigree)


### Name: new.ped
### Title: Create an object of class ped.
### Aliases: new.ped

### ** Examples

data(EgPeds)
head(EgPeds)

ped1 = new.ped(EgPeds[EgPeds$FamID == 1, ])
head(ped1, n = 3)
class(ped1)
summary(ped1)

AllPeds = new.ped(EgPeds)
head(AllPeds)
class(AllPeds)
summary(AllPeds)




