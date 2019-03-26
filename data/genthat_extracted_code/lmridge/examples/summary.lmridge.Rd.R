library(lmridge)


### Name: summary.lmridge
### Title: Summarizing Linear Ridge Regression Fits
### Aliases: summary.lmridge print.summary.lmridge
### Keywords: testing of ridge coefficient

### ** Examples

mod <- lmridge(y~., as.data.frame(Hald), K = c(0, 0.0132, 0.1))
summary(mod)

## coefficients for first biasing parameter
summary(mod)$summaries[[1]]$coefficients
summary(mod)$summaries[[1]][[1]]

## ridge related statistics from summary function
summary(mod)$summaries[[1]]$stats

## Ridge F-test's p-value
summary(mod)$summaries[[1]]$fpvalue



