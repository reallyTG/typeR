library(aroma.core)


### Name: mergeBoxplotStats.list
### Title: Merges a list of boxplot.stats() elements
### Aliases: mergeBoxplotStats.list
### Keywords: methods internal

### ** Examples

library("stats")

x <- matrix(rnorm(1000), ncol=5)
x <- as.data.frame(x)

stats0 <- boxplot(x, plot=FALSE)
stats1 <- lapply(x, FUN=boxplot.stats)
stats1b <- mergeBoxplotStats(stats1)
stopifnot(all.equal(stats0, stats1b))

bxp(stats1b)




