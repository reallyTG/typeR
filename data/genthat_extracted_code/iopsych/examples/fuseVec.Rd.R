library(iopsych)


### Name: fuseVec
### Title: Computes the correlation between a composite and a vector of
###   items.
### Aliases: fuseVec

### ** Examples

data(dls2007)
dat <- dls2007
rxx <- dat[1:4, 2:5]
items <- c(1,3)
wt_a <- c(2,1)

fuseVec(r_mat=rxx, a=items)
fuseVec(r_mat=rxx, a=items, wt_a=wt_a, output="mat")



