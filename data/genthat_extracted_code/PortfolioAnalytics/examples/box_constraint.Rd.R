library(PortfolioAnalytics)


### Name: box_constraint
### Title: constructor for box_constraint.
### Aliases: box_constraint

### ** Examples

data(edhec)
ret <- edhec[, 1:4]

pspec <- portfolio.spec(assets=colnames(ret))

# defaults to min=0 and max=1
pspec <- add.constraint(pspec, type="box")

# specify box constraints as a scalar
pspec <- add.constraint(pspec, type="box", min=0.05, max=0.45)

# specify box constraints per asset
pspec <- add.constraint(pspec, 
                        type="box", 
                        min=c(0.05, 0.10, 0.08, 0.06), 
                        max=c(0.45, 0.55, 0.35, 0.65))
                        



