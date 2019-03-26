library(hettx)


### Name: SKS.stat.int.cov.pool
### Title: SKS.stat.int.cov.pool
### Aliases: SKS.stat.int.cov.pool SKS.stat.int.cov

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
SKS.stat.int.cov.pool(Y = df$Yobs, Z = df$Z, W = df$A, X = df$B)


df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
SKS.stat.int.cov(Y = df$Yobs, Z = df$Z, W = df$A, X = df$B)




