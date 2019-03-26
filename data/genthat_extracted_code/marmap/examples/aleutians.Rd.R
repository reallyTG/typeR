library(marmap)


### Name: aleutians
### Title: Bathymetric data for the Aleutians (Alaska)
### Aliases: aleutians

### ** Examples

# load celt data
data(aleutians)

# class "bathy"
class(aleutians)
summary(aleutians)

# test plot.bathy
plot(aleutians,image = TRUE, 
     bpal = list(c(0,max(aleutians),"grey"),
                 c(min(aleutians),0,"darkblue","lightblue")), 
     land = TRUE, lwd = 0.1, axes = FALSE)
antimeridian.box(aleutians, 10)



