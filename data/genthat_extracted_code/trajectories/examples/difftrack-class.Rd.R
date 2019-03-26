library(trajectories)


### Name: difftrack-class
### Title: Class "difftrack"
### Aliases: difftrack-class difftrack plot,difftrack,ANY-method
### Keywords: classes

### ** Examples

showClass("difftrack")
## example tracks
library(sp)
library(xts)
data(A3)
track2 <- A3
index(track2@time) <- index(track2@time) + 32
track2@sp@coords <- track2@sp@coords + 0.003

## compare and plot
difftrack <- compare(A3, track2)
plot(difftrack)

## space-time cube of the difftrack
## Not run: 
##D  stcube(difftrack)
## End(Not run)



