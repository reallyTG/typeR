library(snowboot)


### Name: lsmi_cv
### Title: Cross-validation to Select an Optimal Combination of n.seed and
###   n.wave
### Aliases: lsmi_cv

### ** Examples

net <- artificial_networks[[1]]
a <- lsmi_cv(net, n.seeds = c(10, 20, 30), n.wave = 5, B = 100)




