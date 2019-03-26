library(causalweight)


### Name: medweight
### Title: Causal mediation analysis based on inverse probability weighting
###   with optional sample selection correction.
### Aliases: medweight

### ** Examples

# A little example with simulated data (10000 observations)
n=10000
x=rnorm(n)
d=(0.25*x+rnorm(n)>0)*1
w=0.2*d+0.25*x+rnorm(n)
m=0.5*w+0.5*d+0.25*x+rnorm(n)
y=0.5*d+m+w+0.25*x+rnorm(n)
# The true direct and partial indirect effects are all equal to 0.5
output=medweight(y=y,d=d,m=m,x=x, w=w, trim=0.05, ATET=FALSE, logit=TRUE, boot=19)
round(output$results,3)
output$ntrimmed



