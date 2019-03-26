library(mccf1)


### Name: plot.mccf1
### Title: Plot the MCC-F1 curve
### Aliases: plot.mccf1

### ** Examples

response <- c(rep(1, 1000), rep(0, 10000))
predictor <- c(rbeta(300, 12, 2), rbeta(700, 3, 4), rbeta(10000, 2, 3))
plot(mccf1(response, predictor))



