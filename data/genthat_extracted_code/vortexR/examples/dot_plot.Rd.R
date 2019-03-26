library(vortexR)


### Name: dot_plot
### Title: Dot plots of mean Vortex parameters
### Aliases: dot_plot

### ** Examples

# Using Pacioni et al. example data. See ?pac.clas for more details.
data(pac.clas)
dot <- dot_plot(data=pac.clas, project='Pacioni_et_al', scenario='ST_Classic',
               yrs=c(80, 120),
               params=c('PExtinct', 'Nextant', 'Het', 'Nalleles'),
               save2disk=FALSE)



