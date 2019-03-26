library(spdep)


### Name: EBImoran.mc
### Title: Permutation test for empirical Bayes index
### Aliases: EBImoran.mc EBImoran
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(nc.sids, package="spData")
EBImoran.mc(nc.sids$SID74, nc.sids$BIR74,
 nb2listw(ncCC89_nb, style="B", zero.policy=TRUE), nsim=999, zero.policy=TRUE)
sids.p <- nc.sids$SID74 / nc.sids$BIR74
moran.mc(sids.p, nb2listw(ncCC89_nb, style="B", zero.policy=TRUE),
 nsim=999, zero.policy=TRUE)
}



