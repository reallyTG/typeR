library(gss)


### Name: mkterm
### Title: Assembling Model Terms for Smoothing Spline ANOVA Models
### Aliases: mkterm
### Keywords: internal

### ** Examples

## cubic marginals
x1 <- rnorm(100); x2 <- rnorm(100); y <- 3+5*sin(x1-2*x2)+rnorm(x1)
fit <- ssanova0(y~x1*x2)
## the same fit
fit1 <- ssanova0(y~x1*x2,type=list(x1="cubic"))
## the same fit one more time
par <- list(nphi=1,mkphi=mkphi.cubic,mkrk=mkrk.cubic,
            env=c(min(x2),max(x2))+c(-1,1)*(max(x2)-min(x2))*.05)
fit2 <- ssanova0(y~x1*x2,type=list(x2=list("custom",par)))
## Clean up
## Not run: rm(x1,x2,y,fit,fit1,par,fit2)

## cubic and thin-plate marginals
x1 <- rnorm(100); x2 <- matrix(rnorm(200),100,2)
y <- 3+5*sin(x1-2*x2[,1]*x2[,2])+rnorm(x1)
fit <- ssanova0(y~x1*x2)
## the same fit
fit1 <- ssanova0(y~x1*x2,type=list(x2="tp"))
## the same fit one more time
mkphi.tp1 <- function(x) mkphi.tp(x$dm,x$ord,x$mesh,x$wt)
mkrk.tp1 <- function(x) mkrk.tp(x$dm,x$ord,x$mesh,x$wt)
env <- list(dm=2,ord=2,mesh=x2,wt=1)
par <- list(nphi=2,mkphi=mkphi.tp1,mkrk=mkrk.tp1,env=env)
fit2 <- ssanova0(y~x1*x2,type=list(x2=list("custom",par)))
## Clean up
## Not run: rm(x1,x2,y,fit,fit1,mkphi.tp1,mkrk.tp1,env,par,fit2)



