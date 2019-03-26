library(ppclust)


### Name: comp.omega
### Title: Compute the possibilistic penalty argument for PCM
### Aliases: comp.omega
### Keywords: cluster

### ** Examples

data(iris)
x <- iris[,-5]

# Run FCM 
res.fcm <- fcm(x=x, centers=3)

# Compute the mobilization scale values using the results from FCM
vomg1 <- comp.omega(pco=res.fcm)
vomg1

# Compute the mobilization scale values using the distances and memberships from FCM
vomg2 <- comp.omega(res.fcm$d, res.fcm$u, m=3)
vomg2

# Compute the mobilization scale values with the K value of 10
vomg3 <- comp.omega(res.fcm$d, res.fcm$u, m=2, K=10)
vomg3



