library(saves)


### Name: saves
### Title: Save the variables of a data.frame in distinct binary files
### Aliases: saves

### ** Examples

## Not run: 
##D ## Saving the demo dataset to evs.2000.hun.RDatas in current working directory.
##D data(evs.2000.hun)
##D saves(evs.2000.hun)
##D ## Saving both the demo dataset and mtcars to current working directory
##D saves(evs.2000.hun, mtcars)
##D saves(list=c('evs.2000.hun', 'mtcars'))
##D ## Saving all kind of cars :)
##D saves(cars, mtcars, overwrite = T)
##D saves(list=c('cars', 'mtcars'), overwrite = T)
## End(Not run)



