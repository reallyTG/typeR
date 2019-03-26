library(PropScrRand)


### Name: pcr
### Title: Propensity-Constrained Randomization
### Aliases: pcr
### Keywords: design multivariate

### ** Examples

# 1:1 allocation, M small
dat1 = data.frame(x1=rnorm(50),
                  x2=rnorm(50),
                  x3=sample(c('a','b','c'), size=50, replace=TRUE))
trial1 = pcr(x=dat1, nTreat=25, M=500, m=50)

# 1:1 allocation, M large
dat2 = data.frame(x1=rnorm(10),
                  x2=rnorm(10),
                  x3=sample(c('a','b','c'), size=10, replace=TRUE))
trial2 = pcr(x=dat2, nTreat=5, M=200, m=20)

# non-1:1 allocation, M small
dat3 = data.frame(x1=rnorm(50),
                  x2=rnorm(50),
                  x3=sample(c('a','b','c'), size=50, replace=TRUE))
trial3 = pcr(x=dat3, nTreat=35, M=200, m=20)

# non-1:1 allocation, M large
dat4 = data.frame(x1=rnorm(10),
                  x2=rnorm(10),
                  x3=sample(c('a','b','c'), size=10, replace=TRUE))
trial4 = pcr(x=dat4, nTreat=6, M=300, m=30)



