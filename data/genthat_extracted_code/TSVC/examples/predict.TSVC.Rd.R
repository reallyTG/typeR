library(TSVC)


### Name: predict.TSVC
### Title: Prediction from Varying Coefficient Trees
### Aliases: predict.TSVC

### ** Examples

# Swiss Labour Market 
library(AER)
data("SwissLabor")

# recode factors
sl <- SwissLabor
sl$participation <- as.numeric(sl$participation)-1
sl$foreign       <- as.numeric(sl$foreign)-1

X_new <- data.frame("income"=c(10,12), "age"=c(4.5,5.8))

## Not run: 
##D fit1 <- TSVC(participation~income+age, data=sl, family=binomial(link="logit"), 
##D              nperm=1000, trace=TRUE)
##D predict(fit1, X_new, type="response")
## End(Not run)





