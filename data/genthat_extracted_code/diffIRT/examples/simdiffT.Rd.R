library(diffIRT)


### Name: simdiffT
### Title: Simulate data according to the traditional diffusion model.
### Aliases: simdiffT
### Keywords: models multivariate

### ** Examples

## Not run: 
##D 
##D # simulate data accroding to the traditional diffusion model
##D set.seed(1310)
##D a=2
##D v=1
##D ter=2
##D sdv=.3
##D N=10000
##D 
##D data=simdiffT(N,a,v,sdv,ter)
##D rt=data$rt
##D x=data$x
##D 
##D # fit the traditional diffusion model (i.e., a restricted D-diffusion model, 
##D # see application 3 of the paper by Molenaar et al., 2013) 
##D 
##D diffIRT(rt,x,model="D",constrain=c(1,2,3,0,4),start=c(rep(NA,3),0,NA)) 
##D 
##D # this constrained model is a traditional diffusion model
##D # please note that the estimated a[i] value = 1/a
##D # and that the estimated v[i] value = -v                  
##D 
## End(Not run)  



