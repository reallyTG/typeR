library(IDetect)


### Name: ID
### Title: Multiple change-point detection in piecewise-constant or
###   continuous, piecewise-linear signals using the Isolate-Detect
###   methodology
### Aliases: ID

### ** Examples

single.cpt.mean <- c(rep(4,3000),rep(0,3000))
single.cpt.mean.normal <- single.cpt.mean + rnorm(6000)
single.cpt.mean.student <- single.cpt.mean + rt(6000, df = 5)
cpt.single.mean.normal <- ID(single.cpt.mean.normal)
cpt.single.mean.student <- ID(single.cpt.mean.student, ht = TRUE)

single.cpt.slope <- c(seq(0, 1999, 1), seq(1998, -1, -1))
single.cpt.slope.normal <- single.cpt.slope + rnorm(4000)
single.cpt.slope.student <- single.cpt.slope + rt(4000, df = 5)
cpt.single.slope.normal <- ID(single.cpt.slope.normal, contrast = "slope")
cpt.single.slope.student <- ID(single.cpt.slope.student, contrast = "slope", ht = TRUE)



