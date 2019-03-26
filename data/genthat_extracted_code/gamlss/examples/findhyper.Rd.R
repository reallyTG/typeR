library(gamlss)


### Name: find.hyper
### Title: A function to select values of hyper-parameters in a GAMLSS
###   model
### Aliases: find.hyper
### Keywords: regression

### ** Examples

## Not run: 
##D data(abdom)
##D # Example estimating the smoothing parameters for mu and 
##D # the transformation parameters for x
##D # declare the model
##D mod1<-quote(gamlss(y~cs(nx,df=p[1]),family=BCT,data=abdom,
##D                         control=gamlss.control(trace=FALSE)))
##D # since we want also to find the transformation for x 
##D # we use the "other"" option
##D op <- find.hyper(model=mod1, other=quote(nx<-x^p[2]), parameters=c(3,0.5), 
##D             lower=c(1,0.001), steps=c(0.1,0.001))
##D op
##D # the optimum parameters found are 
##D # p = (p[1],p[2]) = (3.113218 0.001000) = (df for mu, lambda)
##D # so it needs df = 3 on top of the constant and linear 
##D # in  the cubic spline model for mu since p[1] is approximately  3
##D #  and log transformation for x since p[2] is approximately  0 
##D # here is an example with no data declaration in define the model
##D # we have to attach the data
##D attach(abdom)
##D mod2 <- quote(gamlss(y~cs(nx,df=p[1]),family=BCT,
##D                 control=gamlss.control(trace=FALSE)))
##D op2<-find.hyper(model=mod2, other=quote(nx<-x^p[2]), parameters=c(3,0.5), 
##D                 lower=c(1,0.001), steps=c(0.1,0.001))
##D op2
##D detach(abdom)
##D #--------------------------------------------------------------
##D # showing different ways of estimating the smoothing parameter
##D # get the df using local ML (PQL) 
##D m0 <- gamlss(y~pb(x), data=abdom)
##D # get the df using local GAIC 
##D m1<-gamlss(y~pb(x, method="GAIC", k=2), data=abdom)
##D # fiiting cubic splines with fixed df's at 3
##D m2<-gamlss(y~cs(x, df=3), data=abdom)
##D # fitting cubic splines using find hyper (global GAIC)
##D mod1 <- quote(gamlss(y~cs(x, df=p[1]),family=BCT,data=abdom,control=gamlss.control(trace=FALSE)))
##D op <- find.hyper(model=mod1, parameters=c(3), lower=c(1,0.001), steps=c(0.1,0.001))
##D # now fit final model
##D m3 <- gamlss(y~cs(x, df=op$par), data=abdom)
##D # effetive degrees of fredom for the 4 models
##D edf(m0);edf(m1); m2$mu.df; m3$mu.df
##D # deviances for the four models
##D deviance(m0); deviance(m1); deviance(m2); deviance(m3)
##D # their GAIC
##D GAIC(m0,m1,m2,m3)
##D # plotting  the models
##D plot(y~x, data=abdom, type="n")
##D lines(fitted(m3)~abdom$x, col="red")
##D lines(fitted(m1)~abdom$x, col="green")
##D lines(fitted(m0)~abdom$x, col="blue")
##D # almost identical
## End(Not run) 



