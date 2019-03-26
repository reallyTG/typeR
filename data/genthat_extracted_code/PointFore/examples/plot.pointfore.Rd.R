library(PointFore)


### Name: plot.pointfore
### Title: Plots object of class "pointfore"
### Aliases: plot.pointfore

### ** Examples

#estimate linear probit specification model for quantiles on GDP forecast
res <- estimate.functional(Y=GDP$observation,X=GDP$forecast,
model=probit_linear, stateVariable = GDP$forecast)
#plot results
plot(res)




