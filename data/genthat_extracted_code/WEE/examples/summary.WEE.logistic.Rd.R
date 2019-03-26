library(WEE)


### Name: summary.WEE.logistic
### Title: Summary methods for WEE logistic Regression
### Aliases: summary.WEE.logistic

### ** Examples

## No test: 
## continued from WEE.logistic
## summary of WEE logistic object
summary(WEE.logistic(y ~ x + z, D, 
        data = dat_sample, pd_pop = pD)) 				      
summary(WEE.logistic(y ~ x + z, D, 
        data = dat_sample, pd_pop = pD, boot=500))
## End(No test)



