library(poisson.glm.mix)


### Name: init2.k
### Title: Initialization 2 for the beta_k parameterization (m=3).
### Aliases: init2.k

### ** Examples

# this is to be used as an example with the simulated data

data("simulated_data_15_components_bjk")
x <- sim.data[,1]
x <- array(x,dim=c(length(x),1))
y <- sim.data[,-1]

# At first a 2 component mixture is fitted using parameterization $m=1$.
run.previous<-bkmodel(reference=x, response=y, L=c(3,2,1), m=100, K=2, 
                      nr=-10*log(10), maxnr=5, m2=3, t2=3, prev.z, 
                      prev.clust, start.type=1, prev.alpha, prev.beta)
## Then the estimated clusters and parameters are used to initialize a 
##  3 component mixture using Initialization 2. The number of different 
##  runs is set to tsplit=3 with each one of them using msplit = 5
##  em iterations. 
q <- 3
tau <- 1
nc <- 3
z <- run.previous$z
ml <- length(run.previous$psim)/(nc - 1)
alpha <- array(run.previous$alpha[ml, , ], dim = c(q, nc - 1))
beta <- array(run.previous$beta[ml, , ], dim = c(nc - 1, tau))
clust <- run.previous$clust
run<-init2.k(reference=x, response=y, L=c(3,2,1), K=nc, t2=3, m2=5, previousz=z, 
             previousclust=clust, previous.alpha=alpha, previous.beta=beta,mnr = 5)
summary(run)
# note: useR should specify larger values for m2, t2 for a complete analysis.



