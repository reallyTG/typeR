library(FDGcopulas)


### Name: utdcFDG
### Title: Upper tail dependence coefficient of FDG copulas
### Aliases: utdcFDG

### ** Examples

## FDG copula with 'exponential' generators
myFDGcopula <- FDGcopula("exponential", 1:4)
utdcFDG(myFDGcopula) # upper tail independent
## FDG copula with 'sinus' generators
mySinus <- FDGcopula("sinus", c(.9,1.2,1.3,1.55))
utdcFDG(mySinus)



