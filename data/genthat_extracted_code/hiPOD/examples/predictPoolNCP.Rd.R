library(hiPOD)


### Name: predictPoolNCP
### Title: The prediction model of non-centrality parameter
### Aliases: predictPoolNCP
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function(MAF, OR, error, P, N.p, Xmean){
count <- 1
while(ncp.pool.pred[[1]][count] <= MAF) count<-count+1

ncp.pool.pred.coef <- ncp.pool.pred[[2]][[count]]

covariates <- c(1, MAF, log(OR), error, P, Xmean, N.p, (P^(1/3)), (Xmean^(1/3)), (N.p^(1/3)), (log(OR)^2), MAF*log(OR), Xmean*N.p, MAF*P, MAF*Xmean, MAF*N.p, log(OR)*P, log(OR)*Xmean, log(OR)*N.p, error*P, error*Xmean, error*N.p, MAF*Xmean*N.p, log(OR)*Xmean*N.p, MAF*log(OR)*P, MAF*log(OR)*Xmean, MAF*log(OR)*N.p, error*Xmean*N.p, MAF*log(OR)*Xmean*N.p)

ncp.pool.predicted <- (sum(ncp.pool.pred.coef * covariates))^3

ncp.pool.predicted
  }



