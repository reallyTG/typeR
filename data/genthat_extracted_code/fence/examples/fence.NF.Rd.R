library(fence)


### Name: fence.NF
### Title: Fence model selection (Nonparametric Model)
### Aliases: fence.NF

### ** Examples

## Not run: 
##D require(fence)
##D n = 100
##D set.seed(1234)
##D x=runif(n,0,3)
##D y = 1-x+x^2- 2*(x-1)^2*(x>1) + 2*(x-2)^2*(x>2) + rnorm(n,sd=.2)
##D lambda=exp((c(1:60)-30)/3)
##D data=data.frame(cbind(x,y))   
##D test_NF = fence.NF(full=y~x, data=data, spline='x', ps=c(1:3), qs=c(2,5), B=1000, lambda=lambda)
##D plot(test_NF)
##D summary <- summary(test_NF) 
##D model_sel <- summary[[1]]
##D model_sel
##D lambda_sel <- summary[[2]]
##D lambda_sel
## End(Not run)



