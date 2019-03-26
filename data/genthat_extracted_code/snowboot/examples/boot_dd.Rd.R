library(snowboot)


### Name: boot_dd
### Title: Bootstrapping Empirical Degree Distribution
### Aliases: boot_dd

### ** Examples

net <- artificial_networks[[1]]
lsmiEstimate <- lsmi_dd(net = net, n.seed = 5, n.wave = 3)
bootEstimates <- boot_dd(lsmiEstimate, B = 10)




