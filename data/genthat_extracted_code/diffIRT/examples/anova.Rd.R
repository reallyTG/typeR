library(diffIRT)


### Name: anova
### Title: Conduct a likelihood ratio test on two nested 'diffIRT' models
### Aliases: anova.diffIRT
### Keywords: models multivariate

### ** Examples

## Not run: 
##D 
##D # simulate data according to a D-diffusion model 
##D # with equal a[i] parameters 
##D data=simdiff(100,10,
##D   ai=rep(.3,10),vi=seq(-1,1,length=10),ter=runif(10,2,3),
##D   gamma=rlnorm(100,0,.3),theta=rnorm(100,0,.5),
##D   model="D")
##D 
##D # fit a full D-diffusion model
##D res=diffIRT(data$rt,data$x,model="D")
##D 
##D # fit a D-diffusion model subject to an 
##D # equality constraint across all a[i] parameters
##D res2=diffIRT(data$rt,data$x,model="D",constrain=c(rep(1,10),2:21,22,23))
##D 
##D # use the anova function to conduct the likelihood ratio test
##D anova(res2,res)
##D 
## End(Not run)



