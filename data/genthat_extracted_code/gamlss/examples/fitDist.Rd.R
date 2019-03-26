library(gamlss)


### Name: fitDist
### Title: Fitting Different Parametric 'gamlss.family' Distributions.
### Aliases: fitDist fitDistPred chooseDist getOrder
### Keywords: distribution regression

### ** Examples

y <- rt(100, df=1)
m1<-fitDist(y, type="realline")
m1$fits
m1$failed
# an example of using  extra
## Not run: 
##D #---------------------------------------  
##D # Example of using the argument extra  
##D library(gamlss.tr)
##D data(tensile)
##D gen.trun(par=1,family="GA", type="right")
##D gen.trun(par=1,"LOGNO", type="right")
##D gen.trun(par=c(0,1),"TF", type="both")
##D ma<-fitDist(str, type="real0to1", trace=T,
##D        extra=c("GAtr", "LOGNOtr", "TFtr"), 
##D      data=tensile) 
##D ma$fits
##D ma$failed
##D #-------------------------------------
##D # selecting model using the prediction global deviance
##D # Using fitDistPred
##D # creating training data
##D y <- rt(1000, df=2)
##D m1 <- fitDist(y, type="realline")
##D m1$fits
##D m1$fails
##D # create validation data
##D yn <- rt(1000, df=2)
##D # choose distribution which fits the new data best
##D p1 <- fitDistPred(y, type="realline", newdata=yn)
##D p1$fits
##D p1$failed
##D #---------------------------------------
##D # using the function chooseDist()
##D # fitting normal distribution model
##D m1 <- gamlss(y~pb(x), sigma.fo=~pb(x), family=NO, data=abdom)
##D # choose a distribution on the real line 
##D # and save GAIC(k=c(2,4,6.4),  i.e. AIC, Chi-square and BIC.   
##D t1 <- chooseDist(m1, type="realline", parallel="snow", ncpus=4)
##D # the GAIC's
##D t1
##D # the distributions which failed are with NA's 
##D # ordering according to  BIC
##D getOrder(t1,3)
##D fm<-update(m1, family=names(getOrder(t1,3)[1]))
## End(Not run)



