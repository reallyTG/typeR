library(jtools)


### Name: make_new_data
### Title: Make new data for generating predicted data from regression
###   models.
### Aliases: make_new_data

### ** Examples


fit <- lm(Income ~ Frost + Illiteracy + Murder, data = as.data.frame(state.x77))
# Basic use
new_data <- make_new_data(fit, pred = "Frost")
# Set covariate to specific value
new_data <- make_new_data(fit, pred = "Frost", at = list(Murder = 5))
# Set covariate to several specific values
new_data <- make_new_data(fit, pred = "Frost", at = list(Murder = c(5, 10, 15)))





