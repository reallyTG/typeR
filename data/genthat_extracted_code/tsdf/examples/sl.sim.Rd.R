library(tsdf)


### Name: sl.sim
### Title: Dose-finding simulations for a list of scenarios
### Aliases: sl.sim

### ** Examples

dt <- dec.table(0.6,0.4,0.2,0.3,c(3,3,3))
test.file <- system.file("extdata", "testS.csv", package = "tsdf")
# use a customized decision table
table.file <- system.file("extdata", "decTable.csv", package = "tsdf")
dec <- read.table(table.file, sep=",", col.names=c(3,4,8,10), row.names = 1, check.names = FALSE)
out1 <- sl.sim(dt$table, test.file)
out2 <- sl.sim(dec, test.file)



