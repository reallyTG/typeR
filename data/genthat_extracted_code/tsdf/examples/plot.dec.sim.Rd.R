library(tsdf)


### Name: plot.dec.sim
### Title: plot simulation results from a dec.sim object
### Aliases: plot.dec.sim

### ** Examples

# generate decision table
dt <- dec.table(0.6,0.4,0.2,0.3,c(3,3,3))
# simulate trials from test data 
test.file <- system.file("extdata", "testS.csv", package = "tsdf")
out <- sl.sim(dt$table, test.file)
plot(out, pt=rep(0.3,2), s=1, type="all")
plot(out, pt=rep(0.3,2), s=2, type="prob")
plot(out, pt=rep(0.3,2), s=1, type="np")
plot(out, pt=rep(0.3,2), s=2, type="dlt")



