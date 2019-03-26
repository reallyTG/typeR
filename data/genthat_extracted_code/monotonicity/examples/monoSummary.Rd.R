library(monotonicity)


### Name: monoSummary
### Title: Summary of Patton and Timmermann monotonicity (JoE, 2010) tests
### Aliases: monoSummary

### ** Examples

## load daily non-difference return data.
## test an increasing pattern of monotonicity
## No test: 
data(demo_returns)
monoSummary(demo_returns, increasing = TRUE, block_length = 10)
## End(No test)



