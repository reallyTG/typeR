library(mra)


### Name: F.sat.lik
### Title: F.sat.lik
### Aliases: F.sat.lik
### Keywords: models

### ** Examples
 
data(dipper.histories)
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
for(j in 1:ncol(dipper.histories)){ assign(paste("x",j,sep=""), xy$x[,,j]) } 
dipper.cjs <- F.cjs.estim( ~x2+x3+x4+x5+x6, ~x1+x2+x3+x4+x5, dipper.histories )
deviance <- -F.sat.lik( dipper.histories ) - 2*dipper.cjs$loglik
 


