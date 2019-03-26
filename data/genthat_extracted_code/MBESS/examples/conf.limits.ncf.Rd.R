library(MBESS)


### Name: conf.limits.ncf
### Title: Confidence limits for noncentral F parameters
### Aliases: conf.limits.ncf
### Keywords: design multivariate regression

### ** Examples

conf.limits.ncf(F.value = 5, conf.level = .95, df.1 = 5, 
df.2 = 100)

# A one sided confidence interval.
conf.limits.ncf(F.value = 5, conf.level = NULL, df.1 = 5, 
df.2 = 100, alpha.lower = .05, alpha.upper = 0, tol = 1e-09,
Jumping.Prop = 0.1)



