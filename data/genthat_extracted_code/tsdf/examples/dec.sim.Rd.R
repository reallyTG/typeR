library(tsdf)


### Name: dec.sim
### Title: run dose-finding simulations
### Aliases: dec.sim

### ** Examples

truep <- c(0.3, 0.45, 0.5, 0.6)
res <- dec.table(0.6,0.4,0.2,0.3,c(3,3,3))
out <- dec.sim(truep, res$table, start.level = 2, nsim = 1000)
summary(out, pt = 0.3)



