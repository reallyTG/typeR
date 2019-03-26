library(rms)


### Name: datadist
### Title: Distribution Summaries for Predictor Variables
### Aliases: datadist print.datadist
### Keywords: models nonparametric regression

### ** Examples

## Not run: 
##D d <- datadist(data=1)         # use all variables in search pos. 1
##D d <- datadist(x1, x2, x3)
##D page(d)                       # if your options(pager) leaves up a pop-up
##D                               # window, this is a useful guide in analyses
##D d <- datadist(data=2)         # all variables in search pos. 2
##D d <- datadist(data=my.data.frame)
##D d <- datadist(my.data.frame)  # same as previous.  Run for all potential vars.
##D d <- datadist(x2, x3, data=my.data.frame)   # combine variables
##D d <- datadist(x2, x3, q.effect=c(.1,.9), q.display=c(0,1))
##D # uses inter-decile range odds ratios,
##D # total range of variables for regression function plots
##D d <- datadist(d, z)           # add a new variable to an existing datadist
##D options(datadist="d")         #often a good idea, to store info with fit
##D f <- ols(y ~ x1*x2*x3)
##D 
##D 
##D options(datadist=NULL)        #default at start of session
##D f <- ols(y ~ x1*x2)
##D d <- datadist(f)              #info not stored in `f'
##D d$limits["Adjust to","x1"] <- .5   #reset adjustment level to .5
##D options(datadist="d")
##D 
##D 
##D f <- lrm(y ~ x1*x2, data=mydata)
##D d <- datadist(f, data=mydata)
##D options(datadist="d")
##D 
##D 
##D f <- lrm(y ~ x1*x2)           #datadist not used - specify all values for
##D summary(f, x1=c(200,500,800), x2=c(1,3,5))         # obtaining predictions
##D plot(Predict(f, x1=200:800, x2=3))  # or ggplot()
##D 
##D 
##D # Change reference value to get a relative odds plot for a logistic model
##D d$limits$age[2] <- 30    # make 30 the reference value for age
##D # Could also do: d$limits["Adjust to","age"] <- 30
##D fit <- update(fit)   # make new reference value take effect
##D plot(Predict(fit, age, ref.zero=TRUE, fun=exp),
##D      ylab='Age=x:Age=30 Odds Ratio')   # or ggplot()
## End(Not run)



