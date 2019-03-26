library(causalweight)


### Name: lateweight
### Title: Local average treatment effect estimation based on inverse
###   probability weighting
### Aliases: lateweight

### ** Examples

# A little example with simulated data (10000 observations)
n=10000
u=rnorm(n)
x=rnorm(n)
z=(0.25*x+rnorm(n)>0)*1
d=(z+0.25*x+0.25*u+rnorm(n)>0.5)*1
y=0.5*d+0.25*x+u
# The true LATE is equal to 0.5
output=lateweight(y=y,d=d,z=z, x=x, trim=0.05, LATT=FALSE, logit=TRUE, boot=19)
cat("LATE: ",round(c(output$effect),3),", standard error: ",
             round(c(output$se.effect),3), ", p-value: ",
             round(c(output$pval.effect),3))
output$ntrimmed



