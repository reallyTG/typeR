library(logistic4p)


### Name: logistic4p
### Title: Logistic Regressions with Misclassification Correction
### Aliases: logistic4p

### ** Examples

## Not run: 
##D  
##D data(nlsy)
##D y=nlsy[, 1]
##D x=nlsy[,-1]
##D 
##D mod1=logistic4p(x,y)
##D mod1
##D mod1$estimates
##D 
##D mod2=logistic4p(x,y, model='fp.fn')
##D 
##D mod3=logistic4p(x,y, model='fn')
## End(Not run)



