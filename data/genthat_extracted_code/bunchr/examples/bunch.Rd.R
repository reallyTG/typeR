library(bunchr)


### Name: bunch
### Title: Bunching Analysis
### Aliases: bunch

### ** Examples

# analyzing a kink
ability_vec <- 4000 * rbeta(100000, 2, 5)
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0, 0.2, 0, 1000)
# bunch_viewer(earning_vec, 1000, 20, 20, 1, 1, binw = 20)
estim <- bunch(earning_vec, 1000, 0, 0.2, Tax = 0, 20, 20, 1, 1,
binw = 20, draw=TRUE, nboots = 0, seed = 16)
estim$e

# analyzing a notch
earning_vec <- sapply(ability_vec, earning_fun, 0.2, 0.2, 0.2, 500, 1000)
bunch_viewer(earning_vec, 1000, 10, 40, 2, 22, binw = 50)
estim <- bunch(earning_vec, 1000, 0.2, 0.2, Tax = 500, 10, 40, 2, 22,
binw = 50, draw = FALSE, nboots = 0, seed = 16)
estim$e




