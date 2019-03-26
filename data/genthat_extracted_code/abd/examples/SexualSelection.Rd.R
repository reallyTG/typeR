library(abd)


### Name: SexualSelection
### Title: Sexual Conflict
### Aliases: SexualSelection
### Keywords: datasets

### ** Examples

SexualSelection

histogram(~ difference, SexualSelection, n = 20)

hist(SexualSelection$difference, breaks = 20)

# Calculate the number of tests and the number of negative tests
(n <- length(SexualSelection$difference))
(n.neg <- sum(SexualSelection$difference < 0))

2 * pbinom(q = n.neg, size = n, prob = 0.5)

# With a binomial test
binom.test(n.neg, n, p = 0.5)



