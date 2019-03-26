library(PerFit)


### Name: cutoff
### Title: Compute a cutoff value given the scores of a person-fit
###   statistic
### Aliases: cutoff
### Keywords: univar

### ** Examples

# Load the inadequacy scale data (dichotomous item scores):
data(InadequacyData)

# As an example, compute the Ht person-fit scores:
Ht.out <- Ht(InadequacyData)

# Compute the cutoff value at 1% level:
cutoff(Ht.out, Blvl=.01)



