library(markovchain)


### Name: generatorToTransitionMatrix
### Title: Function to obtain the transition matrix from the generator.
### Aliases: generatorToTransitionMatrix

### ** Examples

energyStates <- c("sigma", "sigma_star")
byRow <- TRUE
gen <- matrix(data = c(-3, 3,
                       1, -1), nrow = 2,
              byrow = byRow, dimnames = list(energyStates, energyStates))
generatorToTransitionMatrix(gen)



