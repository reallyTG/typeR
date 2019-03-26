library(labdsv)


### Name: metrify
### Title: Nearest Metric Space Representation of a Dissimilarity Object
### Aliases: metrify
### Keywords: multivariate

### ** Examples

data(bryceveg) # returns a vegetation data.frame
dis.bc <- dsvdis(bryceveg,'bray/curtis') # calculate a Bray/Curtis
            #  dissimilarity matrix
dis.met <- metrify(dis.bc) # calculate the nearest euclidean
            #  representation



