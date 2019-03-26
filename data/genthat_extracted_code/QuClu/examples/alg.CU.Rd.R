library(QuClu)


### Name: alg.CU
### Title: CU quantile-based clustering algorithm
### Aliases: alg.CU

### ** Examples

out <- alg.CU(iris[,-5],k=3)
out$theta
out$qq

table(out$cl)



