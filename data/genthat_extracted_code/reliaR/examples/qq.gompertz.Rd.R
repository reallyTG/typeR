library(reliaR)


### Name: qq.gompertz
### Title: Quantile versus quantile (QQ) plot for the Gompertz distribution
### Aliases: qq.gompertz
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(sys2)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 0.00121307, theta.est = 0.00173329

qq.gompertz(sys2, 0.00121307, 0.00173329, main = " ", line.qt = FALSE)



