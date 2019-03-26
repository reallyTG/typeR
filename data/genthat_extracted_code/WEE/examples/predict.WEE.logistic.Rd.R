library(WEE)


### Name: predict.WEE.logistic
### Title: WEE logistic Regression Prediction
### Aliases: predict.WEE.logistic

### ** Examples

## No test: 
## continued from WEE.logistic
## predict outcome y based on newx
newx = dat[sample(500000,3, replace=FALSE),][,c("x","z")]
predict(WEE.logistic(y ~ x + z, D, 
        data = dat_sample, pD),newx) 				      
predict(WEE.logistic(y ~ x + z, D, 
        data = dat_sample, pD, boot = 500),newx)
## End(No test)



