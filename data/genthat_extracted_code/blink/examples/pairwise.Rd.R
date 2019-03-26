library(blink)


### Name: pairwise
### Title: Function to take links list that may contain 3-way, 4-way, etc.
###   and reduce it to pairwise only (e.g., a 3-way link 12-45-78 is
###   changed to 2-way links: 12-45, 12-78, 45-78
### Aliases: pairwise

### ** Examples

id <- c(1,2,3,4,5,1,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
lam.gs <- matrix(c(1,1,2,2,3,3,5,6,4,3,4,5,3,2,4,1,2,3,4,2),ncol=20, nrow=4)
est.links <- links(lam.gs)
est.links.pair <- pairwise(est.links)



