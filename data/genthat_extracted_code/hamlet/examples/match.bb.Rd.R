library(hamlet)


### Name: match.bb
### Title: Branch and Bound algorithm implementation for performing
###   multigroup non-bipartite matching
### Aliases: match.bb
### Keywords: cluster design

### ** Examples

data(vcapwide)

# Construct an Euclidean distance example distance matrix using 15 observations from the VCaP study
d <- as.matrix(dist(vcapwide[1:15,c("PSAWeek10", "BWWeek10")]))

bb3 <- match.bb(d, g=3)
str(bb3)

mat <- bb3$matrix 
# binary matching matrix
solvec <- bb3$solution 
# matching vector, where each element indicates to which submatch each observation belongs to

mixplot(data.frame(vcapwide[1:15,c("PSAWeek10", "BWWeek10")], 
 submatch=as.factor(paste("Submatch_",solvec, sep=""))), pch=16, col=rainbow(5))



