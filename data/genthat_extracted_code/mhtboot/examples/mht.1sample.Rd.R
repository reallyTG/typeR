library(mhtboot)


### Name: mht.1sample
### Title: Multiple hypothesis testing based on p value distribution for
###   one sample test
### Aliases: mht.1sample

### ** Examples

n = 50;m = 100;m0 = 20;
sigeff = 1;
Sigma <- 0.25*diag(m)
X <- datgen(n,m,m0,sigeff,Sigma = Sigma)
out1 <- mht.1sample(X,B=100,ncpus = 1)
out1$cutoff
out1$signal



