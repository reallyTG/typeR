library(nse)


### Name: nse.geyer
### Title: Geyer estimator
### Aliases: nse.geyer

### ** Examples

n    = 1000
ar   = 0.9
mean = 1
sd   = 1
set.seed(1234)
x = as.vector(arima.sim(n = n, list(ar = ar), sd = sd) + mean)
nse.geyer(x = x, type = "bm", nbatch = 30)
nse.geyer(x = x, type = "obm", nbatch = 30)
nse.geyer(x = x, type = "iseq", iseq.type = "pos")
nse.geyer(x = x, type = "iseq.bm", iseq.type = "con")



