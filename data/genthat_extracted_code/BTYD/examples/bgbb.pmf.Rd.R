library(BTYD)


### Name: bgbb.pmf
### Title: BG/BB Probability Mass Function
### Aliases: bgbb.pmf

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# The probability that a customer made 3 transactions in the first
# 6 transaction opportunities.
bgbb.pmf(params, n=6, x=3)

# Vectors may also be used as arguments:
bgbb.pmf(params, n=6, x=0:6)



