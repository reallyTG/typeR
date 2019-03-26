library(satellite)


### Name: names
### Title: Get/set Satellite data layer names
### Aliases: names names,Satellite-method names,Satellite-method
###   names<-,Satellite-method

### ** Examples

path <- system.file("extdata", package = "satellite")
files <- list.files(path, pattern = glob2rx("LC08*.TIF"), full.names = TRUE)
sat <- satellite(files)
names(sat)
new_names <- paste0(names(sat), "_test")
names(sat) <- new_names



