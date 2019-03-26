library(knnIndep)


### Name: benchmark.patchwork.copula
### Title: Benchmark function for a new type of non-functional dependence
### Aliases: benchmark.patchwork.copula

### ** Examples

mycor = function(...) cor(...)^2
copula.vals = benchmark.patchwork.copula(mycor,list(),c(.3,1,10))
drop(calculate.power(copula.vals,.95))
roc.plot(generate.roc(copula.vals))



