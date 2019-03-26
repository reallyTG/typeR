library(markovchain)


### Name: ctmc-class
### Title: Class '"ctmc"'
### Aliases: ctmc-class dim,ctmc-method initialize,ctmc-method
###   states,ctmc-method steadyStates,ctmc-method plot,ctmc,missing-method
### Keywords: classes

### ** Examples

energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                       1, -1), nrow = 2,
              byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                 byrow = byRow, generator = gen, 
                 name = "Molecular Transition Model")

steadyStates(molecularCTMC)
## Not run: plot(molecularCTMC)



