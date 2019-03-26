library(surveillance)


### Name: twinstim_profile
### Title: Profile Likelihood Computation and Confidence Intervals for
###   'twinstim' objects
### Aliases: profile.twinstim
### Keywords: htest methods optimize dplot

### ** Examples

# profiling takes a while
## Not run: 
##D #Load the twinstim model fitted to the IMD data
##D data("imdepi", "imdepifit")
##D # for profiling we need the model environment
##D imdepifit <- update(imdepifit, model=TRUE)
##D 
##D #Generate profiling object for a list of parameters for the new model
##D names <- c("h.(Intercept)","e.typeC")
##D coefList <- lapply(names, function(name) {
##D   c(pmatch(name,names(coef(imdepifit))),NA,NA,11)
##D })
##D 
##D #Profile object (necessary to specify a more loose convergence
##D #criterion). Speed things up by using do.ltildeprofile=FALSE (the default)
##D prof <- profile(imdepifit, coefList,
##D   control=list(reltol=0.1, REPORT=1), do.ltildeprofile=TRUE)
##D 
##D #Plot result for one variable
##D par(mfrow=c(1,2))
##D for (name in names) {
##D   with(as.data.frame(prof$lp[[name]]),
##D        matplot(grid,cbind(profile,estimated,wald),
##D                type="l",xlab=name,ylab="loglik"))
##D   legend(x="bottomleft",c("profile","estimated","wald"),lty=1:3,col=1:3)
##D }
## End(Not run)



