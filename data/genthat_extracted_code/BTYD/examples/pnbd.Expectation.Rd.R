library(BTYD)


### Name: pnbd.Expectation
### Title: Pareto/NBD Expectation
### Aliases: pnbd.Expectation

### ** Examples

params <- c(0.55, 10.56, 0.61, 11.64)

# Number of repeat transactions a customer is expected to make in 2 time intervals.
pnbd.Expectation(params, t=2)

# We can also compare expected transactions over time:
pnbd.Expectation(params, t=1:10)



