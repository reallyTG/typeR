library(WRS2)


### Name: t2way
### Title: A two-way ANOVA for trimmed means, M-estimators, and medians.
### Aliases: t2way pbad2way mcp2a mcp2atm print.t2way print.mcp
###   model.matrix.mcp
### Keywords: models

### ** Examples

## 2-way ANOVA on trimmed means
t2way(attractiveness ~ gender*alcohol, data = goggles)

## post hoc tests
mcp2atm(attractiveness ~ gender*alcohol, data = goggles)

## 2-way ANOVA on MOM estimator
pbad2way(attractiveness ~ gender*alcohol, data = goggles)

## post hoc tests
mcp2a(attractiveness ~ gender*alcohol, data = goggles)

## 2-way ANOVA on medians
pbad2way(attractiveness ~ gender*alcohol, data = goggles, est = "median")

## post hoc tests
mcp2a(attractiveness ~ gender*alcohol, data = goggles, est = "median")

## extract design matrix
model.matrix(mcp2a(attractiveness ~ gender*alcohol, data = goggles, est = "median"))



