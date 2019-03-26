library(TreePar)


### Name: bdsky.stt.optim
### Title: bdsky.stt.optim: Estimating piecewise constant birth and death
###   rates in phylogenies with sequentially sampled tips.
### Aliases: bdsky.stt.optim

### ** Examples

set.seed(1)

# simulation of a tree with one rate shift at 0.5:
lambda<-c(3,4)
mu<-c(1,1)
sampprob<-c(0.5,0.5)
time<-c(0,0.5)
n<-10
tree<- sim.bdsky.stt(n,lambda,mu,time,sampprob)
tree2<-addroot(tree[[1]],tree[[1]]$root.edge)
summary<-getx(tree2,sersampling=TRUE)
times<-summary[,1]
ttype<-summary[,2]

## No test: 
# Maximum likelihood parameter estimation:
out <- bdsky.stt.optim(x=times,ttype=ttype,sampprob=sampprob,root=0)
## End(No test)



