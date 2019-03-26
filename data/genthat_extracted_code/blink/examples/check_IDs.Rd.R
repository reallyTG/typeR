library(blink)


### Name: check_IDs
### Title: Check whether 2 records which are estimated to be linked have
###   the same IDs
### Aliases: check_IDs

### ** Examples

id <- c(1,2,3,4,5,1,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
lam.gs <- matrix(c(1,1,2,2,3,3,5,6,4,3,4,5,3,2,4,1,2,3,4,2),ncol=20, nrow=4)
est.links <- links(lam.gs)
est.links.pair <- pairwise(est.links)
recpair <- est.links.pair[[1]]
check_IDs(recpair=recpair,identity_vector=id)



