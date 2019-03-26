library(RMark)


### Name: Donovan.8
### Title: Exercise 8 example data
### Aliases: Donovan.8
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# Donovan.8 can be created with
# Donovan.8=convert.inp("Donovan.8.inp")
do.exercise.8=function()
{
  data(Donovan.8)
# Results agree with the values on the website.
  Donovan.8.poisson=mark(Donovan.8,model="OccupRPoisson",invisible=FALSE,threads=2)
# The following model was not in exercise 8. The NegBin model does 
# better if it is initialized with the r and lambda from the poisson.
  Donovan.8.negbin=mark(Donovan.8,model="OccupRNegBin",
    initial=Donovan.8.poisson,invisible=FALSE,threads=2)
  return(collect.models())
}
exercise.8=do.exercise.8()
# Remove # to see output
# print(exercise.8)
## End(No test)




