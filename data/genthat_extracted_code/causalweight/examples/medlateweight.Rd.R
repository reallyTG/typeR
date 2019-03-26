library(causalweight)


### Name: medlateweight
### Title: Causal mediation analysis with instruments for treatment and
###   mediator based on weighting
### Aliases: medlateweight

### ** Examples

# A little example with simulated data (3000 observations)
## Not run: 
##D n=3000; sigma=matrix(c(1,0.5,0.5,0.5,1,0.5,0.5,0.5,1),3,3)
##D e=(rmvnorm(n,rep(0,3),sigma))
##D x=rnorm(n)
##D zd=(0.5*x+rnorm(n)>0)*1
##D d=(-1+0.5*x+2*zd+e[,3]>0)
##D zm=0.5*x+rnorm(n)
##D m=(0.5*x+2*zm+0.5*d+e[,2])
##D y=0.5*x+d+m+e[,1]
##D # The true direct and indirect effects on compliers are equal to 1 and 0.5, respectively
##D medlateweight(y,d,m,zd,zm,x,trim=0.1,csquared=FALSE,boot=19,cminobs=40,
##D               bwreg=NULL,bwm=NULL,logit=FALSE)
## End(Not run)



