library(agridat)


### Name: tai.potato
### Title: Multi-environment trial of potato
### Aliases: tai.potato
### Keywords: datasets

### ** Examples

data(tai.potato)
dat = tai.potato

require(lattice)
dotplot(variety ~ yield|env, dat, main="tai.potato")

# fixme - need to add tai() example

# note, st4gi::tai assumes there are replications in the data
# https://github.com/reyzaguirre/st4gi/blob/master/R/tai.R




