library(QuClu)


### Name: alg.VS
### Title: VS quantile-based clustering algorithm
### Aliases: alg.VS

### ** Examples

out <- alg.VS(iris[,-5],k=3)
out$theta
out$qq
out$lambda

table(out$cl)



