library(pgee.mixed)


### Name: gen_mixed_data
### Title: Generate correlated bivariate mixed outcome data
### Aliases: gen_mixed_data

### ** Examples

# default settings
gen_mixed_data(rnorm(5), rnorm(5), 10, 0.5)
# separate covariate matrices, non-unit continuous variance
gen_mixed_data(rnorm(5), rnorm(5), 10, 0.5, cov = "separate", sigma_yc = 2)



