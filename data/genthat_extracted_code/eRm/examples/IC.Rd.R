library(eRm)


### Name: IC
### Title: Information criteria
### Aliases: IC IC.ppar
### Keywords: models

### ** Examples

#IC's for Rasch model
res <- RM(raschdat2)             #Rasch model
pres <- person.parameter(res)    #Person parameters
IC(pres)

#IC's for RSM
res <- RSM(rsmdat)
pres <- person.parameter(res)
IC(pres)



