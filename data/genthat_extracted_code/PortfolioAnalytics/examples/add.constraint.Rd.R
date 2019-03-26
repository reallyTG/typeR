library(PortfolioAnalytics)


### Name: add.constraint
### Title: General interface for adding and/or updating optimization
###   constraints.
### Aliases: add.constraint

### ** Examples

data(edhec)
returns <- edhec[, 1:4]
fund.names <- colnames(returns)
pspec <- portfolio.spec(assets=fund.names)

# Add the full investment constraint that specifies the weights must sum to 1.
pspec <- add.constraint(portfolio=pspec, type="weight_sum", min_sum=1, max_sum=1)

# The full investment constraint can also be specified with type="full_investment"
pspec <- add.constraint(portfolio=pspec, type="full_investment")

# Another common constraint is that portfolio weights sum to 0.
pspec <- add.constraint(portfolio=pspec, type="weight_sum", min_sum=0, max_sum=0)
pspec <- add.constraint(portfolio=pspec, type="dollar_neutral")
pspec <- add.constraint(portfolio=pspec, type="active")

# Add box constraints
pspec <- add.constraint(portfolio=pspec, type="box", min=0.05, max=0.4)

# min and max can also be specified per asset
pspec <- add.constraint(portfolio=pspec, 
                        type="box", 
                        min=c(0.05, 0, 0.08, 0.1), 
                        max=c(0.4, 0.3, 0.7, 0.55))
                        
# A special case of box constraints is long only where min=0 and max=1
# The default action is long only if min and max are not specified
pspec <- add.constraint(portfolio=pspec, type="box")
pspec <- add.constraint(portfolio=pspec, type="long_only")

# Add group constraints
pspec <- add.constraint(portfolio=pspec, 
                        type="group", 
                        groups=list(c(1, 2, 1), 4), 
                        group_min=c(0.1, 0.15), 
                        group_max=c(0.85, 0.55), 
                        group_labels=c("GroupA", "GroupB"), 
                        group_pos=c(2, 1))

# Add position limit constraint such that we have a maximum number 
# of three assets with non-zero weights.
pspec <- add.constraint(portfolio=pspec, type="position_limit", max_pos=3)

# Add diversification constraint
pspec <- add.constraint(portfolio=pspec, type="diversification", div_target=0.7)

# Add turnover constraint
pspec <- add.constraint(portfolio=pspec, type="turnover", turnover_target=0.2)

# Add target mean return constraint
pspec <- add.constraint(portfolio=pspec, type="return", return_target=0.007)

# Example using the indexnum argument
portf <- portfolio.spec(assets=fund.names)
portf <- add.constraint(portf, type="full_investment")
portf <- add.constraint(portf, type="long_only")

# indexnum corresponds to the index number of the constraint
# The full_investment constraint was the first constraint added and has 
# indexnum=1
portf$constraints[[1]]

# View the constraint with indexnum=2
portf$constraints[[2]]

# Update the constraint to relax the sum of weights constraint
portf <- add.constraint(portf, type="weight_sum", 
min_sum=0.99, max_sum=1.01, 
indexnum=1)

# Update the constraint to modify the box constraint
portf <- add.constraint(portf, type="box", 
min=0.1, max=0.8, 
indexnum=2)



