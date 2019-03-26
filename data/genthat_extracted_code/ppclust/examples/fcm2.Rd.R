library(ppclust)


### Name: fcm2
### Title: Type-2 Fuzzy C-Means Clustering
### Aliases: fcm2
### Keywords: cluster

### ** Examples

# Load dataset X12
data(x12)

# Initialize the prototype matrix using K-means++ algorithm
v <- inaparc::kmpp(x12, k=2)$v
# Initialize the membership degrees matrix 
u <- inaparc::imembrand(nrow(x12), k=2)$u

# Run FCM2 with the initial prototypes and memberships
fcm2.res <- fcm2(x12, centers=v, memberships=u, m=2)

# Show the fuzzy membership degrees for the top 5 objects
head(fcm2.res$u, 5)



