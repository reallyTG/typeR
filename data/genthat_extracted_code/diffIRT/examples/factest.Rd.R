library(diffIRT)


### Name: factest
### Title: Estimating factor scores for diffIRT models
### Aliases: factest
### Keywords: models multivariate

### ** Examples

## Not run: 
##D  # simulate data accroding to D-diffusion model
##D data=simdiff(N=100,nit=10,model="D")                   
##D 
##D # fit an unconstrained model
##D res1=diffIRT(data$rt,data$x,model="D")          
##D 
##D # estimate factor scores
##D fs=factest(res1) 
## End(Not run)  



