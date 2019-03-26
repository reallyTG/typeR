library(fossil)


### Name: similarity
### Title: Similarity/Dissimilarity Indices
### Aliases: bray.curtis euclidean jaccard simpson sorenson manhattan
###   morisita.horn ochiai kulczynski braun.blanquet
### Keywords: manip

### ** Examples

##Species counts from two different locations
a <- c(1,0,4,3,5,0,0,7)
b <- c(2,1,3,0,0,1,0,6)
bray.curtis(a,b)
jaccard(a,b)
simpson(a,b)
sorenson(a,b)
morisita.horn(a,b)



