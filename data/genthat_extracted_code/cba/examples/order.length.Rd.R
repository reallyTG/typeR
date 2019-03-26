library(cba)


### Name: order.length
### Title: Conciseness of Presentation Measures
### Aliases: order.length
### Keywords: hplot cluster

### ** Examples

d <- dist(matrix(runif(10),ncol=2))
order.length(d)
o <- sample(5,5) # random order
order.length(d, o)



