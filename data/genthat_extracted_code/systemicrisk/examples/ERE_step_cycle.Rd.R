library(systemicrisk)


### Name: ERE_step_cycle
### Title: Does one Gibbs Step on a cycle
### Aliases: ERE_step_cycle

### ** Examples

L=matrix(rexp(9),nrow=3)
lambda <- matrix(0.5,nrow=3,ncol=3)
p <- matrix(0.7, nrow=3,ncol=3)
ERE_step_cycle(r=c(0,1),c=c(1,2),L=L,lambda=lambda,p=p)
ERE_step_cycle(r=c(0,1,2),c=c(0,1,2),L=L,lambda=lambda,p=p)
ERE_step_cycle(r=c(0,1,2),c=c(2,1,0),L=L,lambda=lambda,p=p)




