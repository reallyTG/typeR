library(PointFore)


### Name: probit_break
### Title: probit break specification model with probit link
### Aliases: probit_break

### ** Examples

# plot break probit specification model with constant quantile/expectile level
plot(function(x) probit_break(x,theta=c(0,0)), xlim=c(-1,1))


# plot linear break specification model with state-dependent quantile/expectile level
plot(function(x) probit_break(x,theta=c(0,5)), xlim=c(-1,1))



