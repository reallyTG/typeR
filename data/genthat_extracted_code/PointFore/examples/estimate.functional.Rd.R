library(PointFore)


### Name: estimate.functional
### Title: Estimate Functional
### Aliases: estimate.functional

### ** Examples

# estimate constant quantile level of GDP forecast
res <- estimate.functional(Y=GDP$observation, X=GDP$forecast,
model=constant)
summary(res)
plot(res)

# estimate constant quantile level with only the constant as instrument
res <- estimate.functional(Y=GDP$observation, X=GDP$forecast,
model=constant, instruments="const")
summary(res)

## Not run: 
##D # estimate constant expectile level
##D res <- estimate.functional(Y=GDP$observation, X=GDP$forecast,
##D model=constant, instruments="const", iden.fct = expectiles)
##D summary(res)
##D plot(res)
##D 
##D # estimate state-dependent quantile level with linear probit specification model
##D res <- estimate.functional(Y=GDP$observation, X=GDP$forecast,
##D stateVariable = GDP$forecast, model = probit_linear)
##D summary(res)
##D plot(res)
## End(Not run)



