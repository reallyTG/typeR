library(CHNOSZ)


### Name: basis
### Title: Define Basis Species
### Aliases: basis

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## define basis species
# one, two and three element examples
basis("O2")
basis(c("H2O", "O2"))
basis(c("H2O", "O2", "H+"))
## clear the basis species
basis("")

## Not run: 
##D ## marked dontrun because they produce errors
##D # fewer species than elements
##D basis(c("H2O", "H+"))
##D # more species than elements
##D basis(c("H2O", "O2", "H2", "H+"))
##D # non-independent species
##D basis(c("CO2", "H2O", "HCl", "Cl-", "H+"))
## End(Not run)

## specify activities and states
basis(c("H2O", "O2", "CO2"), c(-2, -78, -3), c("liq", "aq", "aq"))
# change logarithms of activities/fugacities	
basis(c("H2O", "O2"), c(0, -80))	
# change state of CO2
basis("CO2", "gas")



