## ---- fig.show='hold'----------------------------------------------------
library(bayesAB)

A_binom <- rbinom(250, 1, .25)
B_binom <- rbinom(250, 1, .2)

## ---- fig.width=7.3------------------------------------------------------
plotBeta(100, 200) # looks a bit off
plotBeta(65, 200) # perfect

## ---- fig.show='hold'----------------------------------------------------
AB1 <- bayesTest(A_binom, B_binom, priors = c('alpha' = 65, 'beta' = 200), n_samples = 1e5, distribution = 'bernoulli')

## ---- fig.width=7.3------------------------------------------------------
print(AB1)
summary(AB1)
plot(AB1)

## ---- fig.width=7.3------------------------------------------------------
A_pois <- rpois(250, 6.5)
B_pois <- rpois(250, 5.5)

plotGamma(30, 5) # 5-6 seem likely enough

## ---- fig.width=7.3------------------------------------------------------
AB2 <- bayesTest(A_pois, B_pois, priors = c('shape' = 30, 'rate' = 5), n_samples = 1e5, distribution = 'poisson')

print(AB2)
summary(AB2)
plot(AB2)

## ------------------------------------------------------------------------
AB3 <- combine(AB1, AB2, f = `*`, params = c('Probability', 'Lambda'), newName = 'Expectation')

# also equivalent with %>% if you like piping
library(magrittr)

AB3 <- AB1 %>%
  combine(AB2, f = `*`, params = c('Probability', 'Lambda'), newName = 'Expectation')

## ---- fig.width=7.3------------------------------------------------------
print(AB3)
summary(AB3)
plot(AB3)

