library(vortexR)


### Name: rRec
### Title: Calculate the mean recovery rate (Pacioni et al 2017) and
###   compare scenarios
### Aliases: rRec

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
recov <- rRec(pac.clas, project='Pacioni_et_al', scenario='ST_Classic',
              ST=TRUE, runs=3, yr0=1, yrt=120, save2disk=FALSE,
              dir_out='DataAnalysis/rRec')



