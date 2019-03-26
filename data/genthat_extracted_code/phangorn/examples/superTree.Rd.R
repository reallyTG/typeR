library(phangorn)


### Name: superTree
### Title: Super Tree methods
### Aliases: superTree
### Keywords: cluster

### ** Examples


data(Laurasiatherian)
set.seed(1)
bs <- bootstrap.phyDat(Laurasiatherian, FUN = function(x)upgma(dist.hamming(x)), bs=50)

mrp_st <- superTree(bs, rooted=TRUE)
plot(superTree(mrp_st))
## Not run: 
##D rf_st <- superTree(bs, method = "RF")
##D spr_st <- superTree(bs, method = "SPR")
## End(Not run)




