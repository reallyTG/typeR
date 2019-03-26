library(tsdf)


### Name: summary.dec.sim
### Title: Summarizing simulation results from a dec.sim object
### Aliases: summary.dec.sim

### ** Examples

test.file <- system.file("extdata", "testS.csv", package = "tsdf")
dt <- dec.table(0.6,0.4,0.2,0.3,c(3,3,3))
out <- sl.sim(dt$table, test.file)
pt <- c(0.3, 0.4)
summary(out, pt)



