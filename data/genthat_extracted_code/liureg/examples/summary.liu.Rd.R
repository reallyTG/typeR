library(liureg)


### Name: summary.liu
### Title: Summarizing Linear Liu Regression Fits
### Aliases: summary.liu print.summary.liu
### Keywords: Testing of Liu coefficient

### ** Examples

mod <- liu(y~., as.data.frame(Hald), d = c(-2, -1.47218, 0, 0.5, 1) )
summary(mod)
## coefficients for first biasing parameter
summary(mod)$summaries[[1]]$coefficients
summary(mod)$summaries[[1]][[1]]
## Liu related statistics from summary function
summary(mod)$summaries[[1]]$stats



