library(lfstat)


### Name: pooling
### Title: Pooling Procedures of Low Flow Events
### Aliases: pooling pool_ic pool_ma pool_sp pool_it
### Keywords: low-flow

### ** Examples

data(ngaruroro)
ng <- as.xts(ngaruroro)
ng <- ng["1986::1990", ]

drought <- find_droughts(ng)


ic <- pool_ic(drought)
summary(ic)

ma <- pool_ma(drought)
summary(ma)

sp <- pool_sp(drought)
summary(sp)
plot(sp)



