library(gamlss)


### Name: lms
### Title: A function to fit LMS curves for centile estimation
### Aliases: lms
### Keywords: regression

### ** Examples

## Not run: 
##D data(abdom)
##D m1 <- lms(y,x , data=abdom, n.cyc=30)
##D m2 <- lms(y,x ,data=abdom, method.pb="GAIC", k=log(610))
##D # this example takes time
##D data(db)
##D m1 <- lms(y=head, x=age, data=db, trans.x=TRUE)
## End(Not run)



