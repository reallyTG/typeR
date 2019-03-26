library(WEE)


### Name: summary.WEE.quantile
### Title: Summary methods for WEE Quantile Regression
### Aliases: summary.WEE.quantile

### ** Examples

## No test: 
## continued from WEE.quantile
summary(WEE.quantile(y ~ x, D, tau = 0.5, 
                     data = dat_quantile, pd_pop = pd))
summary(WEE.quantile(y ~ x + z, D, tau = c(0.25,0.5), 
                     data = dat_quantile, pd_pop = pd, boot=500))
## End(No test)



