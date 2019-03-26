library(automultinomial)


### Name: drawSamples
### Title: Simulate data from auto- models
### Aliases: drawSamples

### ** Examples

##########generating coefficient values and data
#adjacency matrix A
A=igraph::get.adjacency(igraph::make_lattice(c(40,40)))

#design matrix
X=cbind(rep(1,1600),matrix(rnorm(1600*4),ncol=4))

#correlation parameter
gamma=0.6

#2 response categories (1 column in coefficient matrix)
beta2=matrix(rnorm(5)*0.3,ncol=1)
#This example uses a short burnIn period. Use a longer burnIn in practice.
y2=drawSamples(beta2,gamma,X,A,burnIn=1,nSamples=1)

#3 response categories (2 columns in coefficient matrix)
beta3=matrix(rnorm(10)*0.3,ncol=2)
y3=drawSamples(beta3,gamma,X,A,burnIn=1,nSamples=1)
##########



