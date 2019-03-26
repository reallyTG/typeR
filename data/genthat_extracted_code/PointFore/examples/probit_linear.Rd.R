library(PointFore)


### Name: probit_linear
### Title: linear specification model with probit link
### Aliases: probit_linear

### ** Examples

# plot linear probit specification model with constant quantile/expectile level
plot(function(x) probit_linear(x,theta=c(0,0)), xlim=c(-1,1))


# plot linear probit specification model with state-dependent quantile/expectile level
plot(function(x) probit_linear(x,theta=c(0,5)), xlim=c(-1,1))



