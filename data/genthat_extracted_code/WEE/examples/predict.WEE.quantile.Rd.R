library(WEE)


### Name: predict.WEE.quantile
### Title: WEE quantile Regression Prediction
### Aliases: predict.WEE.quantile

### ** Examples

## No test: 
## continued from WEE.quantile
## prediction based on newx
newx = dat[sample(500000,3, replace=F),][,c("x")]
p1 = predict(WEE.quantile(y ~ x, D, tau = 0.5, 
     data = dat_quantile, pd_pop = pd),newx)	
p1

newx = dat[sample(500000,3, replace=F),][,c("x","z")]
p2 = predict(WEE.quantile(y ~ x + z, D, tau = c(0.25,0.5), 
     data = dat_quantile, pd_pop = pd, boot = 500),newx)
p2
## End(No test)



