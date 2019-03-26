library(diffIRT)


### Name: coef
### Title: Return estimated parameters
### Aliases: coef.diffIRT
### Keywords: models multivariate

### ** Examples
  
## Not run: 
##D # simulate data accroding to D-diffusion IRT model
##D data=simdiff(N=100,nit=10,model="D")          
##D 
##D # fit the D-diffusion IRT model
##D res1=diffIRT(data$rt,data$x)
##D 
##D # extract parameter estimates 
##D coef(res1)
## End(Not run)  



