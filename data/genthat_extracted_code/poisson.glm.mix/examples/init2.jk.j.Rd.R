library(poisson.glm.mix)


### Name: init2.jk.j
### Title: Initialization 2 for the beta_{jk} (m=1) or beta_{j} (m=2)
###   parameterization.
### Aliases: init2.jk.j

### ** Examples



data("simulated_data_15_components_bjk")
x <- sim.data[,1]
x <- array(x,dim=c(length(x),1))
y <- sim.data[,-1]

# At first a 2 component mixture is fitted using parameterization $m=1$.
run.previous<-bjkmodel(reference=x, response=y, L=c(3,2,1), m=100, K=2, 
                       nr=-10*log(10), maxnr=5, m1=2, m2=2, t1=1, t2=2, 
                       msplit, tsplit, prev.z, prev.clust, start.type=1, 
                       prev.alpha, prev.beta)
## Then the estimated clusters and parameters are used to initialize a 
##   3 component mixture using Initialization 2. The number of different
##   runs is set to $tsplit=3$ with each one of them using msplit = 2 
##   em iterations. 
q <- 3
tau <- 1
nc <- 3
z <- run.previous$z
ml <- length(run.previous$psim)/(nc - 1)
alpha <- array(run.previous$alpha[ml, , ], dim = c(q, nc - 1))
beta <- array(run.previous$beta[ml, , , ], dim = c(q, nc - 1, tau))
clust <- run.previous$clust
run<-init2.jk.j(reference=x, response=y, L=c(3,2,1), K=nc, tsplit=2, 
                model=1, msplit=2, previousz=z, previousclust=clust,
                previous.alpha=alpha, previous.beta=beta,mnr = 5)
# note: useR should specify larger values for msplit and tsplit for a complete analysis.



