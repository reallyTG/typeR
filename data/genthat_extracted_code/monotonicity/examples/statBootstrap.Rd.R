library(monotonicity)


### Name: statBootstrap
### Title: Stationary bootstrap method
### Aliases: statBootstrap

### ** Examples


## Assuming daily return data for 100 time series observations.
## The returning matrix for default settings contains 1,000 bootstrap samples.
bootstrap_sample <- statBootstrap(T = 100, block_length = 10)

## 200 bootstrap samples using monthly return data with 250 time series observations.
bootstrap_sample <- statBootstrap(T = 250, bootstrapRep = 200, block_length = 6)



