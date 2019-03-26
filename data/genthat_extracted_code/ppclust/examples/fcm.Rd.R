library(ppclust)


### Name: fcm
### Title: Fuzzy C-Means Clustering
### Aliases: fcm
### Keywords: cluster

### ** Examples

# Load dataset iris 
data(iris)
x <- iris[,-5]

# Initialize the prototype matrix using K-means++ algorithm
v <- inaparc::kmpp(x, k=3)$v

# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(x), k=3)$u

# Run FCM with the initial prototypes and memberships
fcm.res <- fcm(x, centers=v, memberships=u, m=2)

# Show the fuzzy membership degrees for the top 5 objects
head(fcm.res$u, 5)



