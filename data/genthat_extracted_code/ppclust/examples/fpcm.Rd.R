library(ppclust)


### Name: fpcm
### Title: Fuzzy Possibilistic C-Means Clustering
### Aliases: fpcm
### Keywords: cluster

### ** Examples

# Load dataset iris 
data(iris)
x <- iris[,-5]

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x, k=3)$v

# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(x), k=3)$u

# Run FPCM with the initial prototypes and memberships
fpcm.res <- fpcm(x, centers=v, memberships=u, m=2, eta=2)

# Show the fuzzy membership degrees for the top 5 objects
head(fpcm.res$u, 5)

# Show the possibilistic membership degrees for the top 5 objects
head(fpcm.res$t, 5)



