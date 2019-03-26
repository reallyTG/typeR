library(TAM)


### Name: IRT.data.tam
### Title: Extracting Item Response Dataset
### Aliases: IRT.data.tam.mml IRT.data.tam.mml.3pl IRT.data.tamaan

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dichotomous data data.sim.rasch
##D #############################################################################
##D 
##D data(data.sim.rasch)
##D dat <- data.sim.rasch
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml(dat)
##D # extract dataset (and weights and group if available)
##D dmod1 <- IRT.data(mod1)
##D str(dmod1)
## End(Not run)



