library(labdsv)


### Name: euclidify
### Title: Nearest Euclidean Space Representation of a Dissimilarity Object
### Aliases: euclidify
### Keywords: multivariate

### ** Examples

    data(bryceveg) # returns a vegetation data.frame
    dis.bc <- dsvdis(bryceveg,'bray/curtis') # calculate a Bray/Curtis
              #     dissimilarity matrix
    dis.euc <- euclidify(dis.bc) # calculate the nearest euclidean representation 
    ## Not run: plot(dis.bc,dis.euc)



