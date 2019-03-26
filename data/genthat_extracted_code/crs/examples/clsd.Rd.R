library(crs)


### Name: clsd
### Title: Categorical Logspline Density
### Aliases: clsd
### Keywords: nonparametric

### ** Examples

## Not run: 
##D ## Old Faithful eruptions data histogram and clsd density
##D 
##D library(MASS)
##D data(faithful)
##D attach(faithful)
##D 
##D model <- clsd(eruptions)
##D 
##D ylim <- c(0,max(model$density,hist(eruptions,breaks=20,plot=FALSE)$density))
##D 
##D plot(model,ylim=ylim)
##D 
##D hist(eruptions,breaks=20,freq=FALSE,add=TRUE,lty=2)
##D 
##D rug(eruptions)
##D 
##D summary(model)
##D 
##D coef(model)
##D 
##D ## Simulated data
##D 
##D set.seed(42)
##D require(logspline)
##D 
##D ## Example - simulated data
##D 
##D n <- 250
##D x <- sort(rnorm(n))
##D f.dgp <- dnorm(x)
##D 
##D model <- clsd(x)
##D 
##D ## Standard (cubic) estimate taken from the logspline package
##D ## Compute MSEs
##D 
##D mse.clsd <- mean((fitted(model)-f.dgp)^2)
##D 
##D model.logspline <- logspline(x)
##D 
##D mse.logspline <- mean((dlogspline(x,model.logspline)-f.dgp)^2)
##D 
##D ylim <- c(0,max(fitted(model),dlogspline(x,model.logspline),f.dgp))
##D 
##D plot(model,
##D      ylim=ylim,
##D      sub=paste("MSE: logspline = ",format(mse.logspline),", clsd = ",
##D      format(mse.clsd)),
##D      lty=3,
##D      col=3)
##D 
##D xer <- model$xer
##D 
##D lines(xer,dlogspline(xer,model.logspline),col=2,lty=2)
##D lines(xer,dnorm(xer),col=1,lty=1)
##D 
##D rug(x)
##D 
##D legend("topright",c("DGP",
##D                     paste("Cubic Logspline Density (package `logspline', knots = ",
##D                           model.logspline$nknots,")",sep=""),
##D                     paste("clsd Density (degree = ", model$degree, ", segments = ",
##D                           model$segments,", penalty = ",round(model$penalty,2),")",sep="")),
##D        lty=1:3,
##D        col=1:3,
##D        bty="n",
##D        cex=0.75)
##D 
##D summary(model)
##D 
##D coef(model)
##D 
##D ## Simulate data with known bounds
##D 
##D set.seed(42)
##D n <- 10000
##D x <- runif(n,0,1)
##D 
##D model <- clsd(x,lbound=0,ubound=1)
##D 
##D plot(model)
## End(Not run) 



