library(rpf)


### Name: rpf.sample
### Title: Randomly sample response patterns given a list of items
### Aliases: rpf.sample

### ** Examples

# 1 dimensional items
i1 <- rpf.drm()
i1.p <- rpf.rparam(i1)
i2 <- rpf.nrm(outcomes=3)
i2.p <- rpf.rparam(i2)
rpf.sample(5, list(i1,i2), list(i1.p, i2.p))



