library(MATA)


### Name: mata.wald
### Title: Model-Averaged Tail Area Wald (MATA-Wald) Confidence Interval
### Aliases: mata.wald tailarea.z tailarea.t

### ** Examples

# Normal linear prediction:
# Generate single-model Wald and model-averaged MATA-Wald 95% confidence intervals
#
# Data 'y', covariates 'x1' and 'x2', all vectors of length 'n'.
# 'y' taken to have a normal distribution.
# 'x1' specifies treatment/group (factor).
# 'x2' a continuous covariate.
#
# Take the quantity of interest (theta) as the predicted response 
# (expectation of y) when x1=1 (second group/treatment), and x2=15.

n = 20                              # 'n' is assumed to be even
x1 = c(rep(0,n/2), rep(1,n/2))      # two groups: x1=0, and x1=1
x2 = rnorm(n, mean=10, sd=3)
y = rnorm(n, mean = 3*x1 + 0.1*x2)  # data generation

x1 = factor(x1)
m1 = glm(y ~ x1)                    # using 'glm' provides AIC values.
m2 = glm(y ~ x1 + x2)               # using 'lm' doesn't.
aic = c(m1$aic, m2$aic)
delta.aic = aic - min(aic)
model.weights = exp(-0.5*delta.aic) / sum(exp(-0.5*delta.aic))
residual.dfs = c(m1$df.residual, m2$df.residual)

p1 = predict(m1, se=TRUE, newdata=list(x1=factor(1), x2=15))
p2 = predict(m2, se=TRUE, newdata=list(x1=factor(1), x2=15))
theta.hats = c(p1$fit, p2$fit)
se.theta.hats = c(p1$se.fit, p2$se.fit)

#  AIC model weights
model.weights

#  95% Wald confidence interval for theta (under Model 1)
theta.hats[1] + c(-1,1)*qt(0.975, residual.dfs[1])*se.theta.hats[1]

#  95% Wald confidence interval for theta (under Model 2)
theta.hats[2] + c(-1,1)*qt(0.975, residual.dfs[2])*se.theta.hats[2]

#  95% MATA-Wald confidence interval for theta (model-averaging)
mata.wald(theta.hats=theta.hats, se.theta.hats=se.theta.hats, 
        model.weights=model.weights, mata.t=TRUE, residual.dfs=residual.dfs)



