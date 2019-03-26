library(epiphy)


### Name: a2a
### Title: Easily switch between different power law formulations.
### Aliases: a2a a2a.numeric a2a.list

### ** Examples

# Values from the power_law() example:
Ai    <- 38.6245
slope <- 1.9356
n     <- 9

# Usual function call syntax:
a2a(Ai, slope, n, from = "Ai", to = "ai")

# Other syntaxes:
inputs <- list(Ai = Ai, slope = slope, n = n)
a2a(inputs, "ai")
require(magrittr)
inputs %>% a2a("ai")




