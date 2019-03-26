library(prevalence)


### Name: truePrevPools
### Title: Estimate true prevalence from pooled samples
### Aliases: truePrevPools

### ** Examples

## Sandflies in Aurabani, Nepal, 2007
pool_results <- c(0, 0, 0, 0, 0, 0, 0, 0, 1, 0)
pool_sizes <- c(2, 1, 6, 10, 1, 7, 1, 4, 1, 3)

## Sensitivity ranges uniformly between 60% and 95%
## Specificity is considered to be 100%

#> BUGS-style:
truePrevPools(x = pool_results, n = pool_sizes,
              SE = ~dunif(0.60, 0.95), SP = 1)
			  
#> list-style:
SE <- list(dist = "uniform", min = 0.60, max = 0.95)
truePrevPools(x = pool_results, n = pool_sizes,
              SE = SE, SP = 1)



