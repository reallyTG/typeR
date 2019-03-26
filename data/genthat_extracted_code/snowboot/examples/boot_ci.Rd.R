library(snowboot)


### Name: boot_ci
### Title: Confidence Intervals from Bootstrapped Network Degree
###   Distribution
### Aliases: boot_ci

### ** Examples

net <- artificial_networks[[1]]
lsmiEstimate <- lsmi_dd(net = net, n.seed = 5, n.wave = 3)
bootEstimates <- boot_dd(lsmiEstimate, B = 10)
bootIntervals1 <- boot_ci(bootEstimates)

#Another version of the intervals:
bootIntervals2 <- boot_ci(bootEstimates, method = "basic")




