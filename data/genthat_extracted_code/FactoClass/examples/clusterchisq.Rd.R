library(FactoClass)


### Name: chisq.carac
### Title: Chisquare tests of a qualitative variable by several qualitative
###   variables
### Aliases: chisq.carac
### Keywords: multivariate

### ** Examples

data(DogBreeds)
round(chisq.carac(DogBreeds[,-7],DogBreeds[,7]),3)
round(chisq.carac(DogBreeds[,-7],DogBreeds[,7],decr=FALSE),3)



