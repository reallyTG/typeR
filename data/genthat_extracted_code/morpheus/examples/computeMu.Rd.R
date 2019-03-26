library(morpheus)


### Name: computeMu
### Title: Compute mu
### Aliases: computeMu

### ** Examples

io = generateSampleIO(10000, 1/2, matrix(c(1,0,0,1),ncol=2), c(0,0), "probit")
mu = computeMu(io$X, io$Y, list(K=2)) #or just X and Y for estimated K



