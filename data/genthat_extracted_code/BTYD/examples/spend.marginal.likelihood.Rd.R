library(BTYD)


### Name: spend.marginal.likelihood
### Title: Gamma-gamma marginal likelihood
### Aliases: spend.marginal.likelihood

### ** Examples

params <- c(6, 4, 16)
# calculate the marginal distribution of the average transaction value
# of a customer who spent an average of $35 over 3 transactions.
spend.marginal.likelihood(params, m.x=35, x=3)

# Several values can also be computed at once:
spend.marginal.likelihood(params, m.x=30:40, x=3)
spend.marginal.likelihood(params, m.x=35, x=1:10)
spend.marginal.likelihood(params, m.x=30:40, x=1:11)



