library(vortexR)


### Name: Pextinct
### Title: Cumulative probability of extinction at the end of the
###   simulation
### Aliases: Pextinct

### ** Examples

# Using Pacioni et al. example data. See ?pac.run.lhs for more details.
data(pac.run.lhs)
Pext <- Pextinct(pac.run.lhs[[2]], project='Pacioni_et_al',
  scenario='ST_Classic', ST=TRUE, save2disk=FALSE,
  dir_out='DataAnalysis/Pextinct')



