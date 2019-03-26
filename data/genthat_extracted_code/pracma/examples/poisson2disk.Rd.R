library(pracma)


### Name: poisson2disk
### Title: Poisson Disk Sampling
### Aliases: poisson2disk
### Keywords: stat

### ** Examples

set.seed(1111)
P <- poisson2disk(n = 20, m = 10)
head(P)
##            [,1]       [,2]
## [1,] 0.46550264 0.41292487
## [2,] 0.13710541 0.98737065
## [3,] 0.96028255 0.83222920
## [4,] 0.06044078 0.09325431
## [5,] 0.78579426 0.09267546
## [6,] 0.49670274 0.99852771

# Plotting points
# plot(P, pch = 'x', col = "blue")



