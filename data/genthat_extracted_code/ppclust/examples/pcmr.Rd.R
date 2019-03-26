library(ppclust)


### Name: pcmr
### Title: Possibilistic C-Means Clustering with Repulsion
### Aliases: pcmr
### Keywords: cluster

### ** Examples

# Load data set X12
data(x12)

# Initialize the prototype matrix using K-means++
v <- inaparc::kmpp(x12, k=2)$v
# Initialize the memberships degrees matrix 
u <- inaparc::imembrand(nrow(x12), k=2)$u

# Run FCM with the initial prototypes and memberships
fcm.res <- fcm(x12, centers=v, memberships=u, m=2)

# Run PCMR with the prototypes and memberships from FCM run
pcmr.res <- pcmr(x12, centers=fcm.res$v, memberships=fcm.res$u, eta=2)

# Show the typicality degrees for the top 5 objects
head(pcmr.res$t, 5)

# Plot the crisp memberships using maximum typicality degrees
plotcluster(pcmr.res, mt="t", cm="max")

# Plot the crisp memberships using the typicality degrees > 0.5
plotcluster(pcmr.res, mt="t", cm="threshold", tv=0.5)



