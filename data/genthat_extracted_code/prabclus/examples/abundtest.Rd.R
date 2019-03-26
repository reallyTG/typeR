library(prabclus)


### Name: abundtest
### Title: Parametric bootstrap test for clustering in abundance matrices
### Aliases: abundtest
### Keywords: cluster spatial

### ** Examples

# Note: NOT RUN.
# This needs package spdep and a bunch of packages that are
# called by spdep!
# data(siskiyou)
# set.seed(1234)
# x <- prabinit(prabmatrix=siskiyou, neighborhood=siskiyou.nb,
#              distance="logkulczynski")
# a1 <- abundtest(x, times=5, p.nb=0.0465)
# a2 <- abundtest(x, times=5, p.nb=0.0465, teststat="groups",
#                 groupvector=siskiyou.groups)
# These settings are chosen to make the example execution
# faster; usually you will use abundtest(x).
# summary(a1)
# summary(a2)



