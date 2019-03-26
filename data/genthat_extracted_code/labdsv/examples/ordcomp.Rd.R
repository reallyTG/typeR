library(labdsv)


### Name: ordcomp
### Title: Ordination to Dissimilarity Comparison
### Aliases: ordcomp
### Keywords: multivariate hplot

### ** Examples

data(bryceveg) # produces a vegetation data.frame
dis.bc <- dsvdis(bryceveg,'bray/curtis') # creates a Bray/Curtis dissimilarity matrix
pco.bc <- pco(dis.bc,2) # produces a two-dimensional Principal Coordinates Ordination object
ordcomp(pco.bc,dis.bc)



