library(BigVAR)


### Name: VarptoVar1MC
### Title: Converts a VAR coefficient matrix of order p to multiple
###   companion form
### Aliases: VarptoVar1MC

### ** Examples

k=3;p=6
B=matrix(0,nrow=k,ncol=p*k)
A1<- matrix(c(.4,-.02,.01,-.02,.3,.02,.01,.04,.3),ncol=3,nrow=3)
A2 <- matrix(c(.2,0,0,0,.3,0,0,0,.13),ncol=3,nrow=3)
B[,1:k]=A1
B[,(4*k+1):(5*k)]=A2
A <- VarptoVar1MC(B,p,k)



