library(ppclust)


### Name: crisp
### Title: Crisp the fuzzy membership degrees
### Aliases: crisp
### Keywords: cluster

### ** Examples

data(iris)
x <- iris[,1:4]

# Run FCM 
res.fcm <- fcm(x, centers=3)

# Crisp the fuzzy memberships degrees and plot the crisp memberships
cllabels <- crisp(res.fcm$u)
plot(x, col=cllabels)



