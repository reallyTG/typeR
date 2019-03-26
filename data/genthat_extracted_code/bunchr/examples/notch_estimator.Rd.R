library(bunchr)


### Name: notch_estimator
### Title: Analyzing Bunching at a Notch
### Aliases: notch_estimator

### ** Examples

ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0.2, 0.2, 500, 1000)
bunch_viewer(earning_vec, 1000, 15, 30, 2, 21, binw = 50)
notch_estimator(earning_vec, 1000, 0.2, 0.2, 500, 15, 30, 2, 21, binw = 50,
draw = FALSE)$e




