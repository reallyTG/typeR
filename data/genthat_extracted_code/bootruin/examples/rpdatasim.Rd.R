library(bootruin)


### Name: rpdatasim
### Title: Simulating Data, Shaped into a Matrix
### Aliases: rpdatasim
### Keywords: array datagen distribution internal

### ** Examples

# Generate 5 independent samples of size 10 from
# an exponential distribution with mean 10
x <- bootruin:::rpdatasim(n = 10, replications = 5, rexp, rate = 1/10)



