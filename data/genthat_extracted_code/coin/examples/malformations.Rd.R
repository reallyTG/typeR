library(coin)


### Name: malformations
### Title: Maternal Drinking and Congenital Sex Organ Malformation
### Aliases: malformations
### Keywords: datasets

### ** Examples

## Graubard and Korn (1987, Tab. 3)

## One-sided approximative (Monte Carlo) Cochran-Armitage test
## Note: midpoint scores (p < 0.05)
midpoints <- c(0, 0.5, 1.5, 4.0, 7.0)
chisq_test(malformation ~ consumption, data = malformations,
           distribution = approximate(B = 1000), alternative = "greater",
           scores = list(consumption = midpoints))

## One-sided approximative (Monte Carlo) Cochran-Armitage test
## Note: midrank scores (p > 0.05)
midranks <- c(8557.5, 24375.5, 32013.0, 32473.0, 32555.5)
chisq_test(malformation ~ consumption, data = malformations,
           distribution = approximate(B = 1000), alternative = "greater",
           scores = list(consumption = midranks))

## One-sided approximative (Monte Carlo) Cochran-Armitage test
## Note: equally spaced scores (p > 0.05)
chisq_test(malformation ~ consumption, data = malformations,
           distribution = approximate(B = 1000), alternative = "greater")



