library(blink)


### Name: links.compare
### Title: This function takes a set of pairwise links and identifies
###   correct, incorrect, and missing links (correct = estimated and true,
###   incorrect = estimated but not true, missing = true but not estimated)
### Aliases: links.compare

### ** Examples

id <- c(1,2,3,4,5,1,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
lam.gs <- matrix(c(1,1,2,2,3,3,5,6,4,3,4,5,3,2,4,1,2,3,4,2),ncol=20, nrow=4)
est.links <- links(lam.gs)
true.links <- links(matrix(id,nrow=1))
links.compare(est.links, true.links=id)



