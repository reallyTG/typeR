library(rpf)


### Name: rpf.info
### Title: Map an item model, item parameters, and person trait score into
###   a information vector
### Aliases: rpf.info

### ** Examples

i1 <- rpf.drm()
i1.p <- c(.6,1,.1,.95)
theta <- seq(0,3,.05)
plot(theta, rpf.info(i1, i1.p, t(theta)), type="l")



