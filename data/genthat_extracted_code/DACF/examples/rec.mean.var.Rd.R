library(DACF)


### Name: rec.mean.var
### Title: rec.mean.var
### Aliases: rec.mean.var

### ** Examples

# simulate normally distributed true scores
x=rnorm(1000,2,4)
mean(x); var(x)
# induce 20% floor effects
# and estimate the true mean variance from the floor data
x.f=induce.cfe(.2,0,x)
rec.mean.var(x.f)
# induce 20% ceiling effects
# and estimate the true mean and variance from the ceiling data
x.c=induce.cfe(0,.2,x)
rec.mean.var(x.c)
# induce 20% and 10% of floor and ceiling effects, respectively
# and estimate the true mean and variance from the data with floor and ceiling effects
x.cf=induce.cfe(.2,.1,x)
rec.mean.var(x.cf)



