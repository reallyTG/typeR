library(vortexR)


### Name: Ne
### Title: Calculate the effective population size (Ne)
### Aliases: Ne

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
# Calculate Ne for all scenarios in the data. Note the odd value for scenario
# 12, consequent to the population going extinct.
NeAll <- Ne(data=pac.clas, scenarios='all', gen=2.54, yr0=50, yrt=120,
         save2disk=FALSE)



