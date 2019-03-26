library(hamlet)


### Name: match.mat2vec
### Title: Transform a binary matching matrix to a matching vector
### Aliases: match.mat2vec
### Keywords: manip

### ** Examples

data(vcapwide)

# Construct an Euclidean distance example distance matrix using 15 observations from the VCaP study
d <- as.matrix(dist(vcapwide[1:15,c("PSAWeek10", "BWWeek10")]))

bb3 <- match.bb(d, g=3)
str(bb3)

mat <- bb3$matrix 
# matching vector, where each element indicates to which submatch each observation belongs to

mat
solvec <- match.mat2vec(mat)
which(mat[1,] == 1) 
# E.g. the first, third and thirteenth observation are part of the same submatch
which(solvec == solvec[1]) 
# Similarly



