library(PointFore)


### Name: expectiles
### Title: Identification function for state-dependent expectiles
### Aliases: expectiles

### ** Examples

## Estimate expectile level for constant specification model with estimate.functional

res <- estimate.functional(Y=GDP$observation, X=GDP$forecast,
model=constant,
instruments="const",
iden.fct = expectiles)
summary(res)
plot(res)



