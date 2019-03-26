library(dplR)


### Name: treeMean
### Title: Calculate mean across cores in a tree
### Aliases: treeMean
### Keywords: manip

### ** Examples

data(gp.rwl)
gp.ids <- read.ids(gp.rwl, stc = c(0, 2, 1))

gp.treeMean <- treeMean(gp.rwl, gp.ids)
gp.treeMean2 <- treeMean(gp.rwl, gp.ids, na.rm=TRUE)

# look at an example of a single tree with different averaging periods
tree40 <- data.frame(gp.rwl[, c("40A","40B")],
                     gp.treeMean[, "40", drop=FALSE],
                     gp.treeMean2[, "40", drop=FALSE])
names(tree40) <- c("coreA", "coreB", "treeMean1", "treeMean2")
head(tree40,50)

data(ca533)
ca533.treeMean <- treeMean(ca533, autoread.ids(ca533))
# plot using S3method for class "rwl"
plot(ca533.treeMean,plot.type="spag")




