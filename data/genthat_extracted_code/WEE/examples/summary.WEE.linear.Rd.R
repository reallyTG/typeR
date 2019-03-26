library(WEE)


### Name: summary.WEE.linear
### Title: Summary methods for WEE linear Regression
### Aliases: summary.WEE.linear

### ** Examples

## No test: 
## continued from WEE.linear
## summary of WEE linear object
summary(WEE.linear(y ~ x + z, D, 
        data = dat_sample, pd_pop = pD))                                       
summary(WEE.linear(y ~ x + z, D, 
        data = dat_sample, pd_pop = pD, boot=500))
## End(No test)



