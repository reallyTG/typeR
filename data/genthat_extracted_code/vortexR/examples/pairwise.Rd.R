library(vortexR)


### Name: pairwise
### Title: Pairwise comparisons and ranks of scenarios
### Aliases: pairwise

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
pairw<-pairwise(data=pac.clas, project='Pacioni_et_al', scenario='ST_Classic',
               params=c('Nall', 'Het'), yrs=c(60,120), ST=TRUE,
               type='Single-Factor',
               SVs=c('SV1', 'SV2', 'SV3', 'SV4', 'SV5', 'SV6', 'SV7'),
               save2disk=FALSE)



