library(MIAmaxent)


### Name: projectModel
### Title: Project model across explanatory data.
### Aliases: projectModel

### ** Examples

## Not run: 
##D # From vignette:
##D EVstack <- raster::stack(c(
##D   list.files(system.file("extdata", "EV_continuous", package="MIAmaxent"),
##D              full.names=TRUE),
##D   list.files(system.file("extdata", "EV_categorical", package="MIAmaxent"),
##D              full.names=TRUE)))
##D grasslandPreds <- projectModel(model = grasslandmodel,
##D                                transformations = grasslandDVs$transformations,
##D                                data = EVstack)
##D grasslandPreds
## End(Not run)




