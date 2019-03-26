library(QuClu)


### Name: alg.VU
### Title: VU quantile-based clustering algorithm
### Aliases: alg.VU

### ** Examples

out <- alg.VU(iris[,-5],k=3)
out$theta
out$qq

table(out$cl)



