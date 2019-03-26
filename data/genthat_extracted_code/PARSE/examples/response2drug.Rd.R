library(PARSE)


### Name: response2drug
### Title: Gene-expression Data for Asthma Disease
### Aliases: response2drug
### Keywords: dataset

### ** Examples

data(response2drug)
output1 = parse (K=2, lambda = 1, y = response2drug, N = 100,
kms.iter = 50, kms.nstart = 50, eps.diff = 1e-5, eps.em = 1e-5,
model.crit = 'gic', backward = TRUE, cores = 2)
output1$mu.hat.best[, 1:5]



