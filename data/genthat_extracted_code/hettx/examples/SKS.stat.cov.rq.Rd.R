library(hettx)


### Name: SKS.stat.cov.rq
### Title: SKS.stat.cov.rq
### Aliases: SKS.stat.cov.rq

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
SKS.stat.cov.rq(df$Yobs, df$Z, df$A)




