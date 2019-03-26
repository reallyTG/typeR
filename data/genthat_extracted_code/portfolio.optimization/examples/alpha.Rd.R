library(portfolio.optimization)


### Name: alpha
### Title: Set new alpha of a portfolio.model
### Aliases: alpha

### ** Examples

data(sp100w17av30s)
model <- optimal.portfolio(scenario.set)
cvar95 <- optimal.portfolio(objective(model, "expected.shortfall"))
cvar90 <- optimal.portfolio(alpha(cvar95, 0.1))




