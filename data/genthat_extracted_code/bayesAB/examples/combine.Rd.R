library(bayesAB)


### Name: combine
### Title: Combine two 'bayesAB' objects given a binary function.
### Aliases: combine

### ** Examples

A_binom <- rbinom(100, 1, .5)
B_binom <- rbinom(100, 1, .6)

A_norm <- rnorm(100, 6, 1.5)
B_norm <- rnorm(100, 5, 2.5)

AB1 <- bayesTest(A_binom, B_binom,
                 priors = c('alpha' = 1, 'beta' = 1),
                 distribution = 'bernoulli')

AB2 <- bayesTest(A_norm, B_norm,
                 priors = c('mu' = 5, 'lambda' = 1, 'alpha' = 3, 'beta' = 1),
                 distribution = 'normal')

AB3 <- combine(AB1, AB2, f = `*`, params = c('Probability', 'Mu'), newName = 'Expectation')
# Equivalent to
AB3 <- AB1 * grab(AB2, 'Mu')

# To get the same posterior name as well
AB3 <- rename(AB3, 'Expectation')

# Dummy example
weirdVariable <- (AB1 + AB2) * (AB2 / AB1)
weirdVariable <- rename(weirdVariable, 'confusingParam')

print(AB3)
summary(AB3)
plot(AB3)



