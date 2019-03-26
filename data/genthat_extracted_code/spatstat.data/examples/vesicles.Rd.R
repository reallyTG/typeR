library(spatstat.data)


### Name: vesicles
### Title: Vesicles Data
### Aliases: vesicles vesicles.extra
### Keywords: spatial datasets

### ** Examples

  if(require(spatstat)) {
plot(vesicles)
with(vesicles.extra,
     plot(activezone, add=TRUE, col="red"))
   }

## read coordinates of vesicles from raw data, for training purposes
vf <- system.file("rawdata", "vesicles", "vesicles.txt",
                  package="spatstat.data")
if(!any(nzchar(vf)))
   stop("Could not find raw data file vesicles.txt")
vdf <- read.table(vf, header=TRUE)



