library(evolqg)


### Name: CalcRepeatability
### Title: Parametric per trait Repeatabilities
### Aliases: CalcRepeatability

### ** Examples

num.ind = length(iris[,1])
ID = rep(1:num.ind, 2)
ind.data = rbind(iris[,1:4], iris[,1:4]+array(rnorm(num.ind*4, 0, 0.1), dim(iris[,1:4])))
CalcRepeatability(ID, ind.data)



