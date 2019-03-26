library(markovchain)


### Name: is.CTMCirreducible
### Title: Check if CTMC is irreducible
### Aliases: is.CTMCirreducible

### ** Examples

energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                       1, -1), nrow = 2,
              byrow = byRow, dimnames = list(energyStates, energyStates))
molecularCTMC <- new("ctmc", states = energyStates, 
                     byrow = byRow, generator = gen, 
                     name = "Molecular Transition Model")
is.CTMCirreducible(molecularCTMC)




