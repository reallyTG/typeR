library(ade4)


### Name: dist.genet
### Title: Genetic distances from gene frequencies
### Aliases: dist.genet
### Keywords: multivariate

### ** Examples

data(casitas)
casi.genet <- char2genet(casitas,
    as.factor(rep(c("dome", "cast", "musc", "casi"), c(24,11,9,30))))
ldist <- lapply(1:5, function(method) dist.genet(casi.genet,method))
ldist
unlist(lapply(ldist, is.euclid))
kdist(ldist)



