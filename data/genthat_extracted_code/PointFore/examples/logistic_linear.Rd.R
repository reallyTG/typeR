library(PointFore)


### Name: logistic_linear
### Title: linear logistic specification model
### Aliases: logistic_linear

### ** Examples

# plot linear logistic specification model with constant quantile/expectile level
plot(function(x) logistic_linear(x,theta=c(0,0)), xlim=c(-1,1))


# plot linear logistic specification model with state-dependent quantile/expectile level
plot(function(x) logistic_linear(x,theta=c(0,5)), xlim=c(-1,1))



