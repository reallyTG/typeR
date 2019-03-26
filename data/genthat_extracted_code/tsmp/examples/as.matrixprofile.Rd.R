library(tsmp)


### Name: as.matrixprofile
### Title: Convert a TSMP object into another if possible
### Aliases: as.matrixprofile as.multimatrixprofile as.fluss as.chain
###   as.motif as.multimotif as.arccount as.salient

### ** Examples


w <- 50
data <- mp_gait_data
mp <- tsmp(data, window_size = w, exclusion_zone = 1/4, verbose = 0)
mp <- find_motif(mp)
class(mp) # first class will be "Motif"

plot(mp) # plots a motif plot

plot(as.matrixprofile(mp)) # plots a matrix profile plot




