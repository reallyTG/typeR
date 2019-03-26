library(robustbase)


### Name: plot.lts
### Title: Robust LTS Regression Diagnostic Plots
### Aliases: plot.lts ltsPlot
### Keywords: hplot multivariate

### ** Examples

data(hbk)
lts <- ltsReg(Y ~ ., data = hbk)
lts
plot(lts, which = "rqq") 



