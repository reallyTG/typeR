library(WEE)


### Name: predict.WEE.linear
### Title: WEE Linear Regression Prediction
### Aliases: predict.WEE.linear

### ** Examples

## No test: 
## continued from WEE.linear
## predict outcome y based on newx
newx = dat[sample(500000,3, replace=F),][,c("x","z")]
predict(WEE.linear(y ~ x + z, D, 
data = dat_sample, pD),newx)                                        
predict(WEE.linear(y ~ x + z, D, 
data = dat_sample, pD, boot = 500),newx)
## End(No test)



