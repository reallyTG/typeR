library(neotoma)


### Name: get_chroncontrol
### Title: Function to return chronological control tables used to build
###   age models.
### Aliases: get_chroncontrol
### Keywords: IO connection

### ** Examples

## Not run: 
##D #  The point of pulling chronology tables is to re-build or examine the 
##D #  chronological information that was used to build the age-depth model for 
##D #  the core.  You can do this by hand, but the `write_agefile` function works 
##D #  with `download` objects directly.
##D 
##D three_pines <- get_download(get_dataset(get_site("Three Pines Bog"), 
##D                                         datasettype = "pollen"))
##D pines_chron <- get_chroncontrol(three_pines)
##D 
##D # Spline interpolation:
##D model <- smooth.spline(x = pines_chron[[1]]$chron.control$depth,
##D                        y = pines_chron[[1]]$chron.control$age)
##D                        
##D new_ages <- predict(model, x = three_pines[[1]]$sample.meta$depth)
##D 
## End(Not run)



