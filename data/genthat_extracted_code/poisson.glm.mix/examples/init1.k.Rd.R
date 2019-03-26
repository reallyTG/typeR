library(poisson.glm.mix)


### Name: init1.k
### Title: Initialization 1 for the beta_{k} parameterization (m=3).
### Aliases: init1.k

### ** Examples

## load a simulated dataset according to the b_jk model
## number of observations: 500
## design: L=(3,2,1)
data("simulated_data_15_components_bjk")
x <- sim.data[,1]
x <- array(x,dim=c(length(x),1))
y <- sim.data[,-1]
## initialize the parameters for a 2 component mixture
## the number of the small runs are t2 = 3
## each one consisting of m2 = 5 iterations of the EM.
start1 <- init1.k(reference=x, response=y, L=c(3,2,1), 
                       K=2, m2=5, t2=3,mnr = 5)
summary(start1)





