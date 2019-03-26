library(hettx)


### Name: rq.stat
### Title: rq.stat
### Aliases: rq.stat rq.stat.cond.cov rq.stat.uncond.cov

### ** Examples

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
rq.stat(df$Yobs, df$Z)

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
rq.stat.cond.cov(df$Yobs, df$Z, df$A)

df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
rq.stat.uncond.cov(df$Yobs, df$Z, df$A)




