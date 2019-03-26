library(gwrpvr)


### Name: gwrpv
### Title: Genome-Wide Regression P-Value (gwrpv) in R
### Aliases: gwrpv

### ** Examples

beta <- 6.05879
n0 <- 499
n1 <- 1
n2 <- 0
mua <- 13.87226
siga <- 2.58807
mub <- 4.62829
sigb <- 2.51803
pa <- 0.96544
pb <- 0.03456    # alternatively: pb <- 1.0 - pa
gwrpv(beta,n0,n1,n2,mua,siga,mub,sigb,pa,pb)

# note default values have been used for the trim parameters above
# in the following example we explicitly set the trim parameters
#
g <- gwrpv(beta,n0,n1,n2,mua,siga,mub,sigb,pa,pb,logdelta=-16,lognearnorm=-5,logtopsum=8)
g$pvalue



