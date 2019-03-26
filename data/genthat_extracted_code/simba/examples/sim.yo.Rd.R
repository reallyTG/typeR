library(simba)


### Encoding: UTF-8

### Name: sim.yo
### Title: Calculate a binary similarity index you define.
### Aliases: sim.yo
### Keywords: methods multivariate

### ** Examples


data(abis)

##calculate the default Sørensen index
abis.soer <- sim.yo(abis.spec)

##calculate a custom similarity index
abis.sim <- sim.yo(abis.spec, method="(2*a)/((a) + b + c)")




