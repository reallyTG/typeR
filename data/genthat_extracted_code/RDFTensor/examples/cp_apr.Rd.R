library(RDFTensor)


### Name: cp_apr
### Title: Compute nonnegative CP with alternating Poisson
###   regression(CP_APR)
### Aliases: cp_apr
### Keywords: APR Tensor Factorization

### ** Examples

subs=matrix(c(5,1,1,
              3,1,2,
              1,1,3,
              2,1,3,
              4,1,3,
              6,1,3,
              1,1,4,
              2,1,4,
              4,1,4,
              6,1,4,
              1,2,1,
              3,2,1,
              5,2,1),byrow=TRUE,ncol=3)

    X=list(subs=subs,vals=rep(1,nrow(subs)),size=c(6,2,4))
    set.seed(12345)#for reproducability
    P1=cp_apr(X,2,opts=list(alg='mu'))
    print(P1$M)
    set.seed(12345)#for reproducability
    P2=cp_apr(X,2,opts=list(alg='pdnr'))
    print(P2$M)




