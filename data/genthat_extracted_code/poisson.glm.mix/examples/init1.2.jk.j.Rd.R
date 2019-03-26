library(poisson.glm.mix)


### Name: init1.2.jk.j
### Title: 2nd step of Initialization 1 for the beta_{jk} (m=1) or beta_{j}
###   (m=2) parameterization.
### Aliases: init1.2.jk.j

### ** Examples

############################################################
#1.            Example with beta_jk (m=1) model            #
############################################################
## load a simulated dataset according to the b_jk model
## number of observations: 500
## design: L=(3,2,1)
data("simulated_data_15_components_bjk")
x <- sim.data[,1]
x <- array(x,dim=c(length(x),1))
y <- sim.data[,-1]
## initialize the parameters for a 2 component mixture
## the number of the overall small runs are t2 = 2
## each one consisting of m2 = 2 iterations of the EM.
## the number of the small runs for the first step small EM
## is t1 = 2, each one consisting of m1 = 2 iterations.
start2 <- init1.2.jk.j(reference=x, response=y, L=c(3,2,1), 
                       K=2, m1=2, m2=2, t1=2, t2=2, model=1,mnr = 3)
summary(start2)

############################################################
#2.            Example with beta_j (m=2) model             #
############################################################

## initialize the parameters for a 2 component mixture
## the number of the overall small runs are t2 = 3
## each one consisting of m2 = 2 iterations of the EM.
## the number of the small runs for the first step small EM
## is t1 = 2, each one consisting of m1 = 2 iterations.
start2 <- init1.2.jk.j(reference=x, response=y, L=c(3,2,1), 
                       K=2, m1=2, m2=2, t1=2, t2=3, model=2,mnr = 5)
summary(start2)






