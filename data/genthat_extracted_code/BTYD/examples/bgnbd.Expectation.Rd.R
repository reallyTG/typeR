library(BTYD)


### Name: bgnbd.Expectation
### Title: BG/NBD Expectation
### Aliases: bgnbd.Expectation

### ** Examples

params <- c(0.243, 4.414, 0.793, 2.426)

# Number of repeat transactions a customer is expected to make in 2 time intervals.
bgnbd.Expectation(params, t=2)

# We can also compare expected transactions over time:
bgnbd.Expectation(params, t=1:10)



