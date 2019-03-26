library(inaparc)


### Name: imembucr
### Title: Initialization of membership degrees over class range of a
###   selected feature
### Aliases: imembucr
### Keywords: cluster

### ** Examples

data(iris)

# Generate a fuzzy membership matrix using the 1st feature
u <- imembucr(iris[,1:4], k=5, sfidx=1)$u
head(u)
tail(u)

# Generate a fuzzy membership matrix using the internally determined feature
res <- imembucr(iris[,1:4], k=5)
u <- res$u
head(u)
tail(u)



