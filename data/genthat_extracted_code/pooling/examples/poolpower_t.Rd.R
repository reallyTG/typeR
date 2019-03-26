library(pooling)


### Name: poolpower_t
### Title: Visualize T-test Power for Pooling Design
### Aliases: poolpower_t

### ** Examples

# Power for two-sample t-test with d = 0.5, var = 1, and no "other" costs
# per subject
poolpower_t(d = 0.5, sigsq = 1)

# Repeat but for other costs per subject equal to 1/4 the assay cost
poolpower_t(d = 0.5, sigsq = 1, other_costs = 1/4)

# Back to no other costs, but with processing and measurement error
poolpower_t(d = 0.5, sigsq = 1, sigsq_p = 0.2, sigsq_m = 0.1)





