library(ppclust)


### Name: upfc
### Title: Unsupervised Possibilistic Fuzzy C-Means Clustering Algorithm
### Aliases: upfc
### Keywords: cluster

### ** Examples

# Load dataset X16
data(x16)
x <- x16[,-3]

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x, k=2)$v
# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(x), k=2)$u

# Run UPFC
res.upfc <- upfc(x, centers=v, memberships=u, eta=2)

# Display the fuzzy membership degrees
print(round(res.upfc$u, 2))

# Display the typicality degrees
print(round(res.upfc$t, 2))



