library(GDINA)


### Name: simDTM
### Title: Simulating data for diagnostic tree model
### Aliases: simDTM

### ** Examples

## Not run: 
##D K=5
##D g=0.2
##D item.no <- rep(1:6,each=4)
##D # the first node has three response categories: 0, 1 and 2
##D node.no <- rep(c(1,1,2,3),6)
##D Q1 <- matrix(0,length(item.no),K)
##D Q2 <- cbind(7:(7+K-1),rep(1,K),diag(K))
##D for(j in 1:length(item.no)) {
##D   Q1[j,sample(1:K,sample(3,1))] <- 1
##D }
##D Qc <- rbind(cbind(item.no,node.no,Q1),Q2)
##D Tmatrix.set <- list(cbind(c(0,1,2,3,3),c(0,1,2,1,2),c(NA,0,NA,1,NA),c(NA,NA,0,NA,1)),
##D cbind(c(0,1,2,3,4),c(0,1,2,1,2),c(NA,0,NA,1,NA),c(NA,NA,0,NA,1)),
##D cbind(c(0,1),c(0,1)))
##D Tmatrix <- Tmatrix.set[c(1,1,1,1,1,1,rep(3,K))]
##D sim <- simDTM(N=2000,Qc=Qc,gs.parm=matrix(0.2,nrow(Qc),2),Tmatrix=Tmatrix)
##D est <- DTM(dat=sim$dat,Qc=Qc,Tmatrix = Tmatrix)
## End(Not run)



