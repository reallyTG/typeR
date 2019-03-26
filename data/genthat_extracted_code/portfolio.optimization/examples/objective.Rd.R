library(portfolio.optimization)


### Name: objective
### Title: Set new objective of a portfolio.model
### Aliases: objective

### ** Examples

data(sp100w17av30s)
model <- portfolio.model(scenario.set)
mad <- optimal.portfolio(objective(model, "mad"))




