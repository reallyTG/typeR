library(iTOP)


### Name: rv.conf.interval
### Title: Determining a confidence interval for the (partial) RV
###   coefficient
### Aliases: rv.conf.interval

### ** Examples

set.seed(2)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = x1 + matrix(rnorm(n*p), n, p)
x3 = x2 + matrix(rnorm(n*p), n, p)
data = list(x1=x1, x2=x2, x3=x3)
config_matrices = compute.config.matrices(data)
cors_boot = run.bootstraps(config_matrices, nboots=1000)
rv.conf.interval(cors_boot, "x1", "x3", "x2")



