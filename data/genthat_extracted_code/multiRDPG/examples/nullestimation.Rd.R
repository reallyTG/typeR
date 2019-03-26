library(multiRDPG)


### Name: nullestimation
### Title: 'nullestimation' calculates the estimation under the null
###   hypothesis
### Aliases: nullestimation

### ** Examples

#simulate data
U <- matrix(0, nrow=20, ncol=3)
U[,1] <- 1/sqrt(20)
U[,2] <- rep(c(1,-1), 10)/sqrt(20)
U[,3] <- rep(c(1,1,-1,-1), 5)/sqrt(20)

L<-list(diag(c(11,6,2)),diag(c(15,4,1)))
A <- list()
for(i in 1:2){
  P <- U%*%L[[i]]%*%t(U)
  A[[i]] <-apply(P,c(1,2),function(x){rbinom(1,1,x)})
  A[[i]][lower.tri(A[[i]])]<-t(A[[i]])[lower.tri(A[[i]])]
}

#fit model
nullestimation(A,3)





