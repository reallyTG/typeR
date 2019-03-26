library(anthro)


### Name: anthro_prevalence
### Title: Compute prevalence estimates
### Aliases: anthro_prevalence

### ** Examples

library(anthro)

# compute the prevalence estimates for 100 random children
# with weight around 15kg and height around 100cm
res <- anthro_prevalence(
  sex = c(1, 2),
  age = 1000, # days
  weight = rnorm(100, 15, 1),
  lenhei = rnorm(100, 100, 10),
)

# Height-for-age
# We extract prevalence estimates for <-3SD, <-2SD (Stunting)
# and the z-score mean
col_names <- c("Group", "HAZ_unwpop", "HA_3_r", "HA_2_r", "HA_r")
res <- res[, col_names]

# rename the columns
colnames(res) <- c("Group", "Unweighted N", "-3SD", "-2SD", "z-score mean ")

# note that we only generated data for one age group
res




