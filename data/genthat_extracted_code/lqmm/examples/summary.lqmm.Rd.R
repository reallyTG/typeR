library(lqmm)


### Name: summary.lqmm
### Title: Summary for an 'lqmm' Object
### Aliases: summary.lqmm
### Keywords: bootstrap standard errors

### ** Examples

data(Orthodont)
fitOi.lqmm <- lqmm(distance ~ age, random = ~ 1, group = Subject,
	tau = c(0.1,0.5,0.9), data = Orthodont)
summary(fitOi.lqmm)



