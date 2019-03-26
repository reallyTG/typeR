library(BTYD)


### Name: bgbb.Expectation
### Title: BG/BB Expectation
### Aliases: bgbb.Expectation

### ** Examples

params <- c(1.20, 0.75, 0.66, 2.78)
# Expected number of transactions that a randomly chosen customer
# will make in the first 10 transaction opportunities.
bgbb.Expectation(params, n=10)

# We can also compare expected transactions over time:
bgbb.Expectation(params, n=1:10)



