library(TreeSim)


### Name: getx
### Title: getx: Calculating the vector of speciation / transmission times
###   and sampling times for a phylogenetic tree.
### Aliases: getx

### ** Examples

### tree with tips sampled at one timepoint
n<-10
lambda <- 2.0
mu <- 0.5
frac <-0.6
numbsim<-1
trees<-sim.bd.taxa(n, numbsim, lambda, mu, frac,complete=FALSE,stochsampling=TRUE)
branching<-getx(trees[[1]])

### tree with tips sampled sequentially through time
set.seed(1)
n<-10
lambda <- c(2,1,2)
mu <- c(1,0.5,1.5)
sampprob <-c(0.5,0.5,0.5)
times<-c(0,1,2)
numbsim<-2
trees<-lapply(rep(n,numbsim),sim.bdsky.stt,lambdasky=lambda,deathsky=mu,
timesky=times,sampprobsky=sampprob,rho=0,timestop=0)
branchingserial<-getx(trees[[1]][[1]],sersampling=1)



