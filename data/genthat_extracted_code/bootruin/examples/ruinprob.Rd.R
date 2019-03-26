library(bootruin)


### Name: ruinprob
### Title: The Probability of Ruin in the Classical Risk Process
### Aliases: ruinprob
### Keywords: nonparametric

### ** Examples

# Claims have an exponential distribution with mean 10
x <- rexp(10, 0.1)
print(x)

# The estimated probability of ruin
ruinprob(x, reserve = 100, loading = 0.2, interval = 0.25)

# The true probability of ruin of the risk process
ruinprob(
    10, reserve = 100, loading = 0.2,
    flmethod = "exp", compmethod = "exp"
)



