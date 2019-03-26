library(relSim)


### Name: lrMix
### Title: Calculate locuswise likelihood ratios for two person
###   victim/suspect mixtures
### Aliases: lrMix

### ** Examples


data(USCaucs)
p = randomProfilePairs(USCaucs, 10000)
log.lrs = log10(lrMix(p, USCaucs))
boxplot(log.lrs, las = 2)




