library(rpf)


### Name: rpf.prob
### Title: Map an item model, item parameters, and person trait score into
###   a probability vector
### Aliases: rpf.prob rpf.prob,rpf.1dim,numeric,numeric-method
###   rpf.prob,rpf.mdim,numeric,NULL-method
###   rpf.prob,rpf.mdim,numeric,numeric-method
###   rpf.prob,rpf.mdim,numeric,matrix-method
###   rpf.prob,rpf.base,data.frame,numeric-method
###   rpf.prob,rpf.base,matrix,numeric-method
###   rpf.prob,rpf.base,matrix,matrix-method
###   rpf.prob,rpf.1dim,numeric,matrix-method
###   rpf.prob,rpf.1dim.grm,numeric,numeric-method
###   rpf.prob,rpf.mdim.grm,numeric,numeric-method
###   rpf.prob,rpf.mdim.nrm,numeric,matrix-method
###   rpf.prob,rpf.mdim.mcm,numeric,matrix-method
###   rpf.prob,rpf.mdim.grm,numeric,matrix-method rpf_prob_wrapper

### ** Examples

i1 <- rpf.drm()
i1.p <- rpf.rparam(i1)
rpf.prob(i1, c(i1.p), -1)   # low trait score
rpf.prob(i1, c(i1.p), c(0,1))    # average and high trait score



