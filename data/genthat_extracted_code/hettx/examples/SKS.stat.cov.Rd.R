library(hettx)


### Name: SKS.stat.cov.pool
### Title: SKS.stat.cov.pool
### Aliases: SKS.stat.cov.pool SKS.stat.cov

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
SKS.stat.cov.pool(df$Yobs, df$Z, df$A)

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
SKS.stat.cov(df$Yobs, df$Z, df$A)




