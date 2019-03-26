library(mistral)


### Name: AKMCS
### Title: Active learning reliability method combining Kriging and Monte
###   Carlo Simulation
### Aliases: AKMCS

### ** Examples

## Not run: 
##D res = AKMCS(dimension=2,lsf=kiureghian,plot=TRUE)
##D 
##D #Compare with crude Monte-Carlo reference value
##D N = 500000
##D dimension = 2
##D U = matrix(rnorm(dimension*N),dimension,N)
##D G = kiureghian(U)
##D P = mean(G<0)
##D cov = sqrt((1-P)/(N*P))
## End(Not run)

#See impact of kernel choice with serial function from Waarts:
waarts = function(u) {
  u = as.matrix(u)
  b1 = 3+(u[1,]-u[2,])^2/10 - sign(u[1,] + u[2,])*(u[1,]+u[2,])/sqrt(2)
  b2 = sign(u[2,]-u[1,])*(u[1,]-u[2,])+7/sqrt(2)
  val = apply(cbind(b1, b2), 1, min)
}

## Not run: 
##D res = list()
##D res$matern5_2 = AKMCS(2, waarts, plot=TRUE)
##D res$matern3_2 = AKMCS(2, waarts, kernel="matern3_2", plot=TRUE)
##D res$gaussian  = AKMCS(2, waarts, kernel="gauss", plot=TRUE)
##D res$exp       = AKMCS(2, waarts, kernel="exp", plot=TRUE)
##D 
##D #Compare with crude Monte-Carlo reference value
##D N = 500000
##D dimension = 2
##D U = matrix(rnorm(dimension*N),dimension,N)
##D G = waarts(U)
##D P = mean(G<0)
##D cov = sqrt((1-P)/(N*P))
## End(Not run)




