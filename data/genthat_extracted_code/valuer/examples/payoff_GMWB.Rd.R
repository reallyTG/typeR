library(valuer)


### Name: payoff_GMWB
### Title: GMWB payoff class
### Aliases: payoff_GMWB
### Keywords: datasets

### ** Examples

premium <- 100
beta <- 0.15
GMWB_payment <- payoff_GMWB$new(premium, beta)
GMWB_payment$get_payoff()



