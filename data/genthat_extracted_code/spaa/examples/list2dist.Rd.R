library(spaa)


### Name: list2dist
### Title: Convert pairwise list to distance matrix
### Aliases: list2dist
### Keywords: distance

### ** Examples


##list2dist() example
x <- matrix(rnorm(100), nrow=5)
sampledata <- dist(x)
ddd <- dist2list(sampledata)
list2dist(ddd)




