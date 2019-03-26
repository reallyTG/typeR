library(labdsv)


### Name: compspec
### Title: Compositional Specificity Analysis
### Aliases: compspec indspc plot.compspec
### Keywords: multivariate

### ** Examples

data(bryceveg) # returns a vegetation data.frame
dis.bc <- dsvdis(bryceveg,'bray/curtis')
    # returns a Bray/Curtis dissimilarity matrix
compspec(bryceveg,dis.bc)



