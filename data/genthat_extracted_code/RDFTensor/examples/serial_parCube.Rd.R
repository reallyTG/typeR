library(RDFTensor)


### Name: serial_parCube
### Title: Serial 3-mode ParCube algorithm for memory resident tensors
### Aliases: serial_parCube
### Keywords: parCube

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
 opts = default_parcube_options();
 opts[['loss']]='fro'
 opts[['nonneg']]='1'#nmu
 P1=serial_parCube(X,2,1,2,opts=opts)




