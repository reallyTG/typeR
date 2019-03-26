library(ReIns)


### Name: ExcessPareto
### Title: Estimates for excess-loss premiums using a Pareto model
### Aliases: ExcessPareto ExcessHill

### ** Examples

data(secura)

# Hill estimator
H <- Hill(secura$size)

# Premium of excess-loss insurance with retention R
R <- 10^7
ExcessPareto(secura$size, H$gamma, R=R)



