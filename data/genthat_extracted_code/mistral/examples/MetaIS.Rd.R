library(mistral)


### Name: MetaIS
### Title: Metamodel based Impotance Sampling
### Aliases: MetaIS

### ** Examples

kiureghian = function(x, b=5, kappa=0.5, e=0.1) {
x = as.matrix(x)
b - x[2,] - kappa*(x[1,]-e)^2
}

## Not run: 
##D res = MetaIS(dimension=2,lsf=kiureghian,plot=TRUE)
##D 
##D #Compare with crude Monte-Carlo reference value
##D N = 500000
##D dimension = 2
##D U = matrix(rnorm(dimension*N),dimension,N)
##D G = kiureghian(U)
##D P = mean(G<0)
##D cov = sqrt((1-P)/(N*P))
## End(Not run)

#See impact of kernel choice with Waarts function :
waarts = function(u) {
  u = as.matrix(u)
  b1 = 3+(u[1,]-u[2,])^2/10 - sign(u[1,] + u[2,])*(u[1,]+u[2,])/sqrt(2)
  b2 = sign(u[2,]-u[1,])*(u[1,]-u[2,])+7/sqrt(2)
  val = apply(cbind(b1, b2), 1, min)
}

## Not run: 
##D res = list()
##D res$matern5_2 = MetaIS(2,waarts,plot=TRUE)
##D res$matern3_2 = MetaIS(2,waarts,kernel="matern3_2",plot=TRUE)
##D res$gaussian = MetaIS(2,waarts,kernel="gauss",plot=TRUE)
##D res$exp = MetaIS(2,waarts,kernel="exp",plot=TRUE)
##D 
##D #Compare with crude Monte-Carlo reference value
##D N = 500000
##D dimension = 2
##D U = matrix(rnorm(dimension*N),dimension,N)
##D G = waarts(U)
##D P = mean(G<0)
##D cov = sqrt((1-P)/(N*P))
## End(Not run)




