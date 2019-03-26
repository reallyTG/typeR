library(gwrpvr)


### Name: gwrpv_batch
### Title: Batch computation of a list of pvalues of GWA regression beta
###   statistics using a bernoulli-normal mixture distribution
### Aliases: gwrpv_batch

### ** Examples

beta <- c(6.05879, -6.05879, 2.72055, -2.72055, 1.93347,
         -1.93347, 0.88288, -0.88288, 4.28421, -4.28421)
n0 <- c(499, 499, 495, 495, 490, 490, 451, 451, 998, 998)
n1 <- c(1, 1, 5, 5, 10, 10, 48, 48, 2, 2)
n2 <- c(0, 0, 0, 0, 0, 0, 1, 1, 0, 0)
myregresults <- list(beta = beta, n0 = n0, n1 = n1, n2 = n2)
mua <- 13.87226
siga <- 2.58807
mub <- 4.62829
sigb <- 2.51803
pa <- 0.96544
pb <- 1.0 - pa
gwrpv_batch(myregresults,mua,siga,mub,sigb,pa,pb)
# store results in a user-defined variable g
g <- gwrpv_batch(myregresults,mua,siga,mub,sigb,pa,pb,logdelta=-16,lognearnorm=-4,logtopsum=8)
g$pvalue



