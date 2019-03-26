library(lmridge)


### Name: rplots.plot
### Title: Miscellaneous Ridge Plots
### Aliases: rplots.plot
### Keywords: PRESS df trace ridge RSS

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.2, 0.005))
rplots.plot(mod)
rplots.plot(mod, abline = FALSE)



