library(QuClu)


### Name: alg.CS
### Title: CS quantile-based clustering algorithm
### Aliases: alg.CS

### ** Examples

out <- alg.CS(iris[,-5],k=3)
out$theta
out$qq
out$lambda

table(out$cl)



