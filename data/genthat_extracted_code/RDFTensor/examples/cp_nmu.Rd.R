library(RDFTensor)


### Name: cp_nmu
### Title: Compute nonnegative CP with multiplicative updates(NMU)
### Aliases: cp_nmu
### Keywords: NMF NMU

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
set.seed(123)
P1=cp_nmu(X,2)




