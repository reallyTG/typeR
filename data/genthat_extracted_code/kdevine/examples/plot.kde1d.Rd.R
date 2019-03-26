library(kdevine)


### Name: plot.kde1d
### Title: Plotting kde1d objects
### Aliases: plot.kde1d lines.kde1d

### ** Examples

data(wdbc)  # load data
fit <- kde1d(wdbc[, 7])  # estimate density
plot(fit)  # plot density estimate

fit2 <- kde1d(as.ordered(wdbc[, 1])) # discrete variable
plot(fit2, col = 2)




