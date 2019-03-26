library(lqmm)


### Name: predict.lqmm
### Title: Predictions from an 'lqmm' Object
### Aliases: predint predint.lqmm predict.lqmm
### Keywords: prediction

### ** Examples

## Orthodont data
data(Orthodont)

# Random intercept model
fitOi.lqmm <- lqmm(distance ~ age, random = ~ 1, group = Subject,
	tau = c(0.1,0.5,0.9), data = Orthodont)

# Predict (y - Xb)	
predict(fitOi.lqmm, level = 0)

# Predict (y - Xb - Zu)
predict(fitOi.lqmm, level = 1)

# 95% confidence intervals
predint(fitOi.lqmm, level = 0, alpha = 0.05)




