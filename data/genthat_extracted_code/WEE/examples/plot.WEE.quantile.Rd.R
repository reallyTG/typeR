library(WEE)


### Name: plot.WEE.quantile
### Title: Plot coefficients estimated from WEE.quantile
### Aliases: plot.WEE.quantile

### ** Examples

## No test: 
## continued from WEE.quantile
## plot fitted model without pointwise confidence interval
plot(WEE.quantile(y ~ x, D, tau = 0.5, 
                  data = dat_quantile, pd_pop = pd),index = c(2,3)) 	

## plot fitted model with pointwise confidence interval
plot(WEE.quantile(y ~ x + z, D, tau = c(0.25,0.5), 
                  data = dat_quantile, pd_pop = pd, boot = 500), 
                  CI = TRUE)
## End(No test)



