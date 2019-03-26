library(PooledMeanGroup)


### Name: GQtest
### Title: GQtest
### Aliases: GQtest

### ** Examples

# creating artificial variables
x1=rnorm(30,0,1)
x2=rnorm(30,0,1)
e=rnorm(30,0,0.2)
y=1+2*x1+3*x2+e
# any model
model=lm(y~x1+x2)
#BGtest
ExpGQtest=GQtest(residuals=resid(model), subsample=c(15,16), nep=3)
ExpGQtest



