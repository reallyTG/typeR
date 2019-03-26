library(pooling)


### Name: poolvar_t
### Title: Visualize Ratio of Variance of Each Pooled Measurement to
###   Variance of Each Unpooled Measurement as Function of Pool Size
### Aliases: poolvar_t

### ** Examples

# Plot ratio of variances vs. pool size with default settings
poolvar_t()

# Add processing error and other per-subject costs
poolvar_t(sigsq_p = 0.2, other_costs = 0.1)





