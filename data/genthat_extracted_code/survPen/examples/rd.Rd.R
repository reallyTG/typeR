library(survPen)


### Name: rd
### Title: Defining random effects in survPen formulae
### Aliases: rd

### ** Examples

# cubic regression spline of time with 10 unspecified knots + random effect at the cluster level
formula.test <- ~smf(time,df=10) + rd(cluster)





