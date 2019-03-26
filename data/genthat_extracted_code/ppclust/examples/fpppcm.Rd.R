library(ppclust)


### Name: fpppcm
### Title: Fuzzy Possibilistic Product Partition C-Means Clustering
### Aliases: fpppcm
### Keywords: cluster

### ** Examples

# Load dataset X16
data(x16)
x <- x16[,-3]
# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x, k=2)$v
# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(x), k=2)$u

# Run FPPPCM 
res.fpppcm <- fpppcm(x, centers=v, memberships=u, m=2, eta=2)

# Display typicality degrees 
res.fpppcm$t

# Run FPPPCM for eta=3
res.fpppcm <- fpppcm(x, centers=v, memberships=u, m=2, eta=3)

# Display typicality degrees 
res.fpppcm$t



