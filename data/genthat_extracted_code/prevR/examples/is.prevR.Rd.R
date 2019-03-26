library(prevR)


### Name: is.prevR
### Title: Test if an object is of class prevR. This function test if the
###   class of an object is 'prevR'.  It could be used to test the slot
###   'rings' or the slot 'boundary'.
### Aliases: is.prevR
### Keywords: class

### ** Examples

col <- c(id = "cluster", 
  x = "x",
  y = "y",
  n = "n",
  pos = "pos",
  c.type = "residence",
  wn = "weighted.n",
  wpos = "weighted.pos"
)
dhs <- as.prevR(fdhs.clusters,col, fdhs.boundary)

is.prevR(dhs)
is.prevR(dhs,"rings")
is.prevR(dhs,"boundary")

dhs <- rings(dhs,N=300)
is.prevR(dhs,"rings")




