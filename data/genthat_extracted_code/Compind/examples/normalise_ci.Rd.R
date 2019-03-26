library(Compind)


### Name: normalise_ci
### Title: Normalisation and polarity functions
### Aliases: normalise_ci

### ** Examples

data(EU_NUTS1)

# Standard z-scores normalisation #
data_norm = normalise_ci(EU_NUTS1,c(2:3),c("NEG","POS"),method=1,z.mean=0, z.std=1)
summary(data_norm$ci_norm)

# Normalisation for MPI index #
data_norm = normalise_ci(EU_NUTS1,c(2:3),c("NEG","POS"),method=1,z.mean=100, z.std=10)
summary(data_norm$ci_norm)

data_norm = normalise_ci(EU_NUTS1,c(2:3),c("NEG","POS"),method=2)
summary(data_norm$ci_norm)



