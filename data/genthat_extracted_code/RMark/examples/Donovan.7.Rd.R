library(RMark)


### Name: Donovan.7
### Title: Exercise 7 example data
### Aliases: Donovan.7
### Keywords: datasets

### ** Examples


# Donovan.7 can be created with
# Donovan.7=convert.inp("Donovan.7.inp")

do.exercise.7=function()
{
  data(Donovan.7)
# Estimates from following agree with estimates on website but the
# log-likelihood values do not agree.  Maybe a difference in whether the
# constant binomial coefficients are included.
  Donovan.7.poisson=mark(Donovan.7,model="OccupRNPoisson",invisible=FALSE,threads=1)
# THe following model was not in exercise 7.
  Donovan.7.negbin=mark(Donovan.7,model="OccupRNNegBin",invisible=FALSE,threads=1)
  return(collect.models())
}
exercise.7=do.exercise.7()
# Remove # to see output
# print(exercise.7)






