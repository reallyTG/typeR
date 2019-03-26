library(lestat)


### Name: conditional
### Title: The Conditional Distribution
### Aliases: conditional conditional.default conditional.binomialbeta
###   conditional.mdiscretedistribution conditional.mnormalexpgamma
###   conditional.mnormalgamma conditional.mnormal
###   conditional.mtdistribution conditional.muniformdistribution
###   conditional.normalexpgamma conditional.normalgamma
### Keywords: Conditional distribution

### ** Examples

prior <- normalexpgamma() #Generate a two-parameter flat prior
full <- linearpredict(prior, rep(1, 7)) #Normal extension
data <- simulate(uniformdistribution(), 7) #Generate data
posterior <- conditional(full, 1:7, data) #Condition on parameters
credibilityinterval(marginal(posterior, 1)) #Investigate posterior



