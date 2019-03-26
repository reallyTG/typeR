library(rpf)


### Name: rpf.logprob
### Title: Map an item model, item parameters, and person trait score into
###   a probability vector
### Aliases: rpf.logprob rpf.logprob,rpf.1dim,numeric,numeric-method
###   rpf.logprob,rpf.1dim,numeric,matrix-method
###   rpf.logprob,rpf.mdim,numeric,matrix-method
###   rpf.logprob,rpf.mdim,numeric,numeric-method
###   rpf.logprob,rpf.mdim,numeric,NULL-method rpf_logprob_wrapper

### ** Examples

i1 <- rpf.drm()
i1.p <- rpf.rparam(i1)
rpf.logprob(i1, c(i1.p), -1)   # low trait score
rpf.logprob(i1, c(i1.p), c(0,1))    # average and high trait score



