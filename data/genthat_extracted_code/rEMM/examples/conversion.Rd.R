library(rEMM)


### Name: TRAC
### Title: TRAC: Creating an EMM from a Regular Clustering
### Aliases: TRAC
### Keywords: models

### ** Examples

data("EMMsim")

## using kmeans
cl <- kmeans(EMMsim_train, 10)
emm <- TRAC(cl)
emm
plot(emm, method = "MDS")

## using a cluster assignment vector (taken from the k-means clustering above)
x <- cl$cluster
emm <- TRAC(x, data = EMMsim_train)
emm
plot(emm, method = "MDS")



