library(neotoma)


### Name: get_site
### Title: Return Site Information.
### Aliases: get_site
### Keywords: IO connection

### ** Examples

## Not run: 
##D #  What is the distribution of site elevations in Neotoma?
##D all.sites <- get_site()  #takes a bit of time.
##D 
##D plot(density(all.sites$elev, from = 0, na.rm=TRUE),
##D main = 'Altitudinal Distribution of Neotoma Sites', xlab = 'Altitude (m)', log='x')
##D 
##D #  Get site information from a dataset:
##D nw.datasets <- get_dataset(loc = c(-140, 50, -110, 65), 
##D                            datasettype='pollen',
##D                            taxonname='Pinus*')
##D                            
##D nw.sites <- get_site(nw.datasets)
##D 
## End(Not run)



