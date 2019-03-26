library(ph2bye)


### Name: BB.aniplot
### Title: Sequentially monitor patients using Beta-Binomial posterior
###   probability
### Aliases: BB.aniplot

### ** Examples

# Using APL data
r=rep(0,6)
BB.aniplot(a=1,b=1,r=r, alpha=0.05, seed=1234)
# Simulate binomial data
B <- 10; N=1; p=0.3
r <- rbinom(n = B,size = N,prob = p)
BB.aniplot(a=1,b=1,r=r,time.interval = 0.2,output = FALSE)



