library(updog)


### Name: oracle_mis_vec
### Title: Returns the oracle misclassification rates for each genotype.
### Aliases: oracle_mis_vec

### ** Examples

## Hardy-Weinberg population with allele-frequency of 0.75.
## Moderate bias and moderate overdispersion.
ploidy <- 4
dist <- stats::dbinom(0:ploidy, ploidy, 0.75)
om <- oracle_mis_vec(n = 100, ploidy = ploidy, seq = 0.001,
                     bias = 0.7, od = 0.01, dist = dist)
om

## Get same output as oracle_mis this way:
sum(dist * om)
oracle_mis(n = 100, ploidy = ploidy, seq = 0.001,
           bias = 0.7, od = 0.01, dist = dist)




