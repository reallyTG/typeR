library(automultinomial)


### Name: MPLE
### Title: Maximum pseudolikelihood estimation
### Aliases: MPLE

### ** Examples

##########generating coefficient values and data
A=igraph::get.adjacency(igraph::make_lattice(c(40,40))) #adjacency matrix A
X=cbind(rep(1,1600),matrix(rnorm(1600*4),ncol=4)) #design matrix
gamma=0.6 #correlation parameter
beta=matrix(rnorm(5)*0.3,ncol=1) #covariate parameters
y=drawSamples(beta,gamma,X,A,burnIn=10,nSamples=1)

##########fitting model
fit=MPLE(X = X,y=factor(y),A = A,ciLevel = 0.99,method = "asymptotic")




