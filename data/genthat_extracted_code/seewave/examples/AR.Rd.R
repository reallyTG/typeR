library(seewave)


### Name: AR
### Title: Acoustic Richness index
### Aliases: AR
### Keywords: ts index

### ** Examples

## input as R objects
data(orni)
data(tico)
AR(orni, tico)
## give names to objects if you wish to have them as row names of the returned data.frame
AR(orni=orni, tico=tico)
## input as files stored in the working directory
## file names will be used as row names of the returned data.frame
## Not run: 
##D require(tuneR)
##D AR(getwd(), datatype="files")
## End(Not run)



