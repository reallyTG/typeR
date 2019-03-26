library(lmridge)


### Name: info.plot
### Title: Model Selection Criteria Plots
### Aliases: info.plot
### Keywords: model selection criteria ridge regression ridge degrees of
###   freedom

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = seq(0, 0.15, 0.002))
## for indication vertical line (df ridge)
info.plot(mod)

## without vertical line set \code{abline = FALSE}
info.plot(mod, abline = FALSE)



