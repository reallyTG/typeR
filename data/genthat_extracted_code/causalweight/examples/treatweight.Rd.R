library(causalweight)


### Name: treatweight
### Title: Treatment evaluation based on inverse probability weighting with
###   optional sample selection correction.
### Aliases: treatweight

### ** Examples

# A little example with simulated data (10000 observations)
n=10000
x=rnorm(n); d=(0.25*x+rnorm(n)>0)*1
y=0.5*d+0.25*x+rnorm(n)
# The true ATE is equal to 0.5
output=treatweight(y=y,d=d,x=x, trim=0.05, ATET=FALSE, logit=TRUE, boot=19)
cat("ATE: ",round(c(output$effect),3),", standard error: ",
    round(c(output$se),3), ", p-value: ",round(c(output$pval),3))
output$ntrimmed
# An example with non-random outcome selection and an instrument for selection
n=10000
sigma=matrix(c(1,0.6,0.6,1),2,2)
e=(2*rmvnorm(n,rep(0,2),sigma))
x=rnorm(n)
d=(0.5*x+rnorm(n)>0)*1
z=rnorm(n)
s=(0.25*x+0.25*d+0.5*z+e[,1]>0)*1
y=d+x+e[,2]; y[s==0]=0
# The true ATE is equal to 1
output=treatweight(y=y,d=d,x=x, s=s, z=z, selpop=FALSE, trim=0.05, ATET=FALSE, logit=TRUE, boot=19)
cat("ATE: ",round(c(output$effect),3),", standard error: ",
    round(c(output$se),3), ", p-value: ",round(c(output$pval),3))
output$ntrimmed



