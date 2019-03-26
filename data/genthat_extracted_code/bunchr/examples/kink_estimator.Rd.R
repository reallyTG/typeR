library(bunchr)


### Name: kink_estimator
### Title: Analyzing Bunching at a Kink
### Aliases: kink_estimator

### ** Examples

ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0, 0.2, 0, 1000)
# bunch_viewer(earning_vec, 1000, 40, 40, 1, 1, binw = 10)
kink_estimator(earning_vec, 1000, 0, 0.2, 40, 40, 1, 1, binw = 10, draw = FALSE)$e




