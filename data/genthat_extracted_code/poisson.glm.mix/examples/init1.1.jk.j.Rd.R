library(poisson.glm.mix)


### Name: init1.1.jk.j
### Title: 1st step of Initialization 1 for the beta_{jk} (m=1) or beta_{j}
###   (m=2) parameterization.
### Aliases: init1.1.jk.j

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
## initialize the component specific parameters 
##                   for a 2 component mixture
start1 <- init1.1.jk.j(reference=x, response=y, L=c(3,2,1), 
                       K=2, t1=3, model=1, m1=5,mnr = 5)
summary(start1)

############################################################
#2.            Example with beta_j (m=2) model             #
############################################################

start1 <- init1.1.jk.j(reference=x, response=y, L=c(3,2,1), 
                       K=2, t1=3, model=2, m1=5,mnr = 5)
summary(start1)




