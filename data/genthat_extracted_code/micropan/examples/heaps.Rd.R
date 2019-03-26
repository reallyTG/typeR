library(micropan)


### Name: heaps
### Title: Heaps law estimate
### Aliases: heaps

### ** Examples

# Loading a Panmat object in the micropan package 
data(list="Mpneumoniae.blast.panmat",package="micropan")

# Estimating population openness
h.est <- heaps(Mpneumoniae.blast.panmat,n.perm=500)
if(h.est[2]>1){
  cat("Population is closed with alpha =",h.est[2], "\n")
} else {
  cat("Population is open with alpha =",h.est[2], "\n")
}




