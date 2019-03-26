library(bayesplot)


### Name: example-data
### Title: Example draws to use in demonstrations and tests
### Aliases: example-data example_mcmc_draws example_yrep_draws
###   example_y_data example_x_data example_group_data
### Keywords: internal

### ** Examples

draws <- example_mcmc_draws()
dim(draws)
dimnames(draws)

draws <- example_mcmc_draws(1, 2)
dim(draws)
colnames(draws)

draws <- example_mcmc_draws(params = 6)
dimnames(draws)[[3]]

y <- example_y_data()
x <- example_x_data()
group <- example_group_data()
length(y)
length(x)
length(group)
tail(data.frame(y, x, group), 5)

yrep <- example_yrep_draws()
dim(yrep) # ncol(yrep) = length(y) = length(x) = length(group)




