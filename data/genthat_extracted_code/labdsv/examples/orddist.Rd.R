library(labdsv)


### Name: orddist
### Title: Ordination Point Pair-Wise Distance Calculation
### Aliases: orddist
### Keywords: multivariate hplot

### ** Examples

data(bryceveg) # produces a vegetation data.frame
dis.bc <- dsvdis(bryceveg,'bray/curtis') # creates a Bray/Curtis 
                                         #dissimilarity matrix
pco.bc <- pco(dis.bc,2) # produces a two-dimensional Principal Coordinates 
                        #Ordination object
orddist(pco.bc,dim=2)



