library(ppclust)


### Name: pcm
### Title: Possibilistic C-Means Clustering
### Aliases: pcm
### Keywords: cluster

### ** Examples

# Load the dataset X12
data(x12)

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x12, k=2)$v
# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(x12), k=2)$u

# Run FCM with the initial prototypes and memberships
fcm.res <- fcm(x12, centers=v, memberships=u, m=2)

# Run PCM with the prototypes and memberships from FCM run
pcm.res <- pcm(x12, centers=fcm.res$v, memberships=fcm.res$u, eta=2)

# Display the typicality degrees
print(pcm.res$t)

# Plot the crisp memberships using maximum typicality degrees
plotcluster(pcm.res, mt="t", trans=TRUE )

# Plot the crisp memberships using the typicality degrees > 0.5
plotcluster(pcm.res, mt="t", cm="threshold", tv=0.5)



