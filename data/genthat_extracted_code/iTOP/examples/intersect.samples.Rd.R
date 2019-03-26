library(iTOP)


### Name: intersect.samples
### Title: Intersect samples between datasets.
### Aliases: intersect.samples

### ** Examples

set.seed(2)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = matrix(rnorm(n*p), n, p)
rownames(x1) = rownames(x2) = paste0("X",1:n)
data = list(x1=x1[1:90,], x2=x2[10:100,])
data = intersect.samples(data)



