library(ebSNP)


### Name: ebSNP
### Title: Genotype-call for single-sample next generation sequencing data
###   using empirical Bayes method
### Aliases: ebSNP

### ** Examples


N <- 100
cvg <- 40
pi0 <- 0.95
a <- 1
b <- 10
pi1 <- 1-pi0
z <- rbinom(N,1,pi1)
n.homo <- N-sum(z)
p <- rep(0,N)
p[which(z==0)] <- rbeta(n.homo,a,b)
p[which(z==1)] <- 1/2
nc <- sapply(1-p,function(x) rbinom(1,cvg,x)) 
dat <- rbind(nc,cvg-nc)
ebSNP(dat)
ebSNP(dat,0.1,0.9)



