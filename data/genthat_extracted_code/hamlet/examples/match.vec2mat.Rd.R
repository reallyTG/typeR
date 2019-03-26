library(hamlet)


### Name: match.vec2mat
### Title: Transform a matching vector to a binary matching matrix
### Aliases: match.vec2mat
### Keywords: manip

### ** Examples

data(vcapwide)

# Construct an Euclidean distance example distance matrix using 15 observations from the VCaP study
d <- as.matrix(dist(vcapwide[1:15,c("PSAWeek10", "BWWeek10")]))

bb3 <- match.bb(d, g=3)
str(bb3)

solvec <- bb3$solution 
# matching vector, where each element indicates to which submatch each observation belongs to

solvec
mat <- match.vec2mat(solvec)
mat
which(mat[1,] == 1) 
# E.g. the first, third and thirteenth observation are part of the same submatch
which(solvec == solvec[1]) 
# Similarly



