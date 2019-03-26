library(diveMove)


### Name: readLocs
### Title: Read comma-delimited file with location data
### Aliases: readLocs
### Keywords: manip

### ** Examples


## Do example to define object zz with location of dataset
utils::example("sealLocs", package="diveMove",
               ask=FALSE, echo=FALSE)
locs <- readLocs(zz, idCol=1, dateCol=2,
                 dtformat="%Y-%m-%d %H:%M:%S", classCol=3,
                 lonCol=4, latCol=5, sep=";")

summary(locs)




