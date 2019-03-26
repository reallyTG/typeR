library(np)


### Name: Engel95
### Title: 1995 British Family Expenditure Survey
### Aliases: Engel95
### Keywords: datasets

### ** Examples

## Not run: 
##D ## Example - compute nonparametric instrumental regression using
##D ## Landweber-Fridman iteration of Fredholm integral equations of the
##D ## first kind.
##D 
##D ## We consider an equation with an endogenous regressor (`z') and an
##D ## instrument (`w'). Let y = phi(z) + u where phi(z) is the function of
##D ## interest. Here E(u|z) is not zero hence the conditional mean E(y|z)
##D ## does not coincide with the function of interest, but if there exists
##D ## an instrument w such that E(u|w) = 0, then we can recover the
##D ## function of interest by solving an ill-posed inverse problem.
##D 
##D data(Engel95)
##D 
##D ## Sort on logexp (the endogenous regressor) for plotting purposes
##D 
##D Engel95 <- Engel95[order(Engel95$logexp),] 
##D 
##D attach(Engel95)
##D 
##D model.iv <- npregiv(y=food,z=logexp,w=logwages,method="Landweber-Fridman")
##D phihat <- model.iv$phi
##D 
##D ## Compute the non-IV regression (i.e. regress y on z)
##D 
##D ghat <- npreg(food~logexp,regtype="ll")
##D 
##D ## For the plots, restrict focal attention to the bulk of the data
##D ## (i.e. for the plotting area trim out 1/4 of one percent from each
##D ## tail of y and z)
##D 
##D trim <- 0.0025
##D 
##D plot(logexp,food,
##D      ylab="Food Budget Share",
##D      xlab="log(Total Expenditure)",
##D      xlim=quantile(logexp,c(trim,1-trim)),
##D      ylim=quantile(food,c(trim,1-trim)),
##D      main="Nonparametric Instrumental Kernel Regression",
##D      type="p",
##D      cex=.5,
##D      col="lightgrey")
##D 
##D lines(logexp,phihat,col="blue",lwd=2,lty=2)
##D 
##D lines(logexp,fitted(ghat),col="red",lwd=2,lty=4)
##D 
##D legend(quantile(logexp,trim),quantile(food,1-trim),
##D        c(expression(paste("Nonparametric IV: ",hat(varphi)(logexp))),
##D          "Nonparametric Regression: E(food | logexp)"),
##D        lty=c(2,4),
##D        col=c("blue","red"),
##D        lwd=c(2,2))
## End(Not run) 



