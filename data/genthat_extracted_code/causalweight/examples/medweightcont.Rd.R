library(causalweight)


### Name: medweightcont
### Title: Causal mediation analysis with a continuous treatment based on
###   weighting by the inverse of generalized propensity scores
### Aliases: medweightcont

### ** Examples

# A little example with simulated data (10000 observations)
n=10000
x=runif(n=n,min=-1,max=1)
d=0.25*x+runif(n=n,min=-2,max=2)
d=d-min(d)
m=0.5*d+0.25*x+runif(n=n,min=-2,max=2)
y=0.5*d+m+0.25*x+runif(n=n,min=-2,max=2)
# The true direct and indirect effects are all equal to 0.5
output=medweightcont(y,d,m,x, d0=2, d1=3, ATET=FALSE, trim=0.05, lognorm=FALSE, bw=NULL, boot=19)
round(output$results,3)
output$ntrimmed



