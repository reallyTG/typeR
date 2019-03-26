library(RBesT)


### Name: mix
### Title: Mixture Distributions
### Aliases: mix dmix pmix qmix rmix [[.mix

### ** Examples

## a beta mixture
bm <- mixbeta(weak=c(0.2, 2, 10), inf=c(0.4, 10, 100), inf2=c(0.4, 30, 80))

## extract the two most informative components
bm[[c(2,3)]]
## rescaling needed in order to plot
plot(bm[[c(2,3),rescale=TRUE]])

summary(bm)





