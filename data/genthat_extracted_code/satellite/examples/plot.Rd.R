library(satellite)


### Name: plot
### Title: Plot a Satellite object
### Aliases: plot plot,Satellite,ANY-method plot,Satellite-method

### ** Examples

## Not run: 
##D ## sample data
##D path <- system.file("extdata", package = "satellite")
##D files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
##D sat <- satellite(files)
##D 
##D ## display data without quality flag layer
##D bds <- getSatBCDE(sat)[1:11]
##D plot(sat, bcde = bds)
## End(Not run)




