library(simba)


### Name: boxes
### Title: Adaption of boxplot.n.
### Aliases: boxes batons
### Keywords: hplot

### ** Examples


data(abis)

## see environmental data (see documentation on data for details)
abis.env

## calculate the difference in similarities for the three major  
## vegetation types
## therefore created a vector from the data expressing belonging
## to the vegetation types:
tcs.sub <- rep(0, 61)
tcs.sub[abis.env[,29]==1] <- 1
tcs.sub[abis.env[,30]==1] <- 2
tcs.sub[abis.env[,31]==1] <- 3

## calculate similarity (Jaccard) between all pairs of plots
abis.jacc <- sim(abis.spec, method="jaccard")

## make boxplots regarding the similarities for each vegetation
## type, including the number of pairs contained in each box.
boxes(as.matrix(abis.jacc)~tcs.sub, shrink=1.2)

## prettier
boxes(as.matrix(abis.jacc)~tcs.sub, notch=TRUE, col="grey50", 
shrink=1.2, ylim=c(-0.1, 0.9))

## make batonplots
batons(as.matrix(abis.jacc)~tcs.sub)




