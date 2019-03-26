library(mixR)


### Name: plot.mixfitEM
### Title: Plotting the Fitted Mixture Models
### Aliases: plot.mixfitEM

### ** Examples

x <- rmixnormal(200, c(0.3, 0.7), c(2, 5), c(1, 0.7))
fit <- mixfit(x, ncomp = 2)
plot(fit)  # base R plotting system
plot(fit, "ggplot2")  # ggplot2 plotting system




