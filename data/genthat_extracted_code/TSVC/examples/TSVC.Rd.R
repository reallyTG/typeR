library(TSVC)


### Name: TSVC
### Title: Tree-Structured Modelling of Varying Coefficients
### Aliases: TSVC print.TSVC

### ** Examples

# Swiss Labour Market 
library(AER)
data("SwissLabor")

# recode factors
sl <- SwissLabor
sl$participation <- as.numeric(sl$participation)-1
sl$foreign       <- as.numeric(sl$foreign)-1

## Not run: 
##D fit1 <- TSVC(participation~income+age, data=sl, family=binomial(link="logit"), 
##D              nperm=300, trace=TRUE)
##D print(fit1)
##D class(fit$model) # glm 
##D 
##D # In fit2, variable 'foreign' does not serve as effect modifier 
##D # and the effect of 'foreign' is not modified by the other variables.
##D # That means 'foreign' is assumed to only have simple linear effect on the response. 
##D fit2 <- TSVC(participation~income+age+foreign, data=sl, family=binomial(link="logit"), 
##D              nperm=300, trace=TRUE, effmod=c("income","age"), 
##D              notmod=list(c("foreign","income"),c("foreign","age")))
##D print(fit2)
##D 
##D # In fit3, variable 'age' does only serve as effect modifier. That means the effect of 'age' 
##D # is not included in the predictor of the model.    
##D fit3 <- TSVC(participation~income+age+foreign, data=sl, family=binomial(link="logit"),
##D              nperm=300, trace=TRUE, only_effmod="age")
##D print(fit3)  
##D 
##D # In fit4, the intercept is allowed to be modified by 'age' and 'income'. 
##D # The two covariates, however, are not allowed to modify each other. 
##D fit4 <- TSVC(participation~income+age, data=sl, family=binomial(link="logit"),
##D              nperm=300, trace=TRUE, split_intercept=TRUE,
##D              notmod=list(c("income","age"), c("age", "income")))
##D print(fit4)    
##D 
##D 
##D # In fit5, variable 'age' has a smooth effect on the response. 
##D # Hence, the (smooth) effect of 'age' will not be modified by the other variables.  
##D fit5 <- TSVC(participation~income+age+foreign, data=sl, family=binomial(link="logit"),
##D              nperm=300, trace=TRUE, smooth="age")                     
##D print(fit5)
##D class(fit5$model) # gam                     
##D 
## End(Not run)




