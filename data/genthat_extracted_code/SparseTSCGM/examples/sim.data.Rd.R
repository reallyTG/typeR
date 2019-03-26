library(SparseTSCGM)


### Name: sim.data
### Title: Multivariate time series simulation with chain graphical models
### Aliases: sim.data

### ** Examples

seed = 321
datas <- sim.data(model="ar1", time=4,n.obs=3, n.var=5,seed=seed,prob0=0.35,
         network="random")
data.ts <-  datas$data1
prec_true <- datas$theta
autoR_true <- datas$gamma



