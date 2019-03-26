library(simba)


### Name: com.sim
### Title: Compare mean similarity between subsets of data
### Aliases: com.sim
### Keywords: methods multivariate

### ** Examples

data(abis)

## see environmental data (see documentation on data for details)
abis.env

## calculate the difference in similarities for the three major  
## vegetation types
## therefore create a vector from the data expressing belonging
## to the vegetation types:
tcs.sub <- rep(0, 61)
tcs.sub[abis.env[,29]==1] <- 1
tcs.sub[abis.env[,30]==1] <- 2
tcs.sub[abis.env[,31]==1] <- 3

## calulate differences with Bray-Curtis as the distance measure
com.sim(abis.spec, tcs.sub, simil="bray", binary=FALSE)

## calculate differences with Soerensen as the similarity measure
com.sim(abis.spec, tcs.sub)





