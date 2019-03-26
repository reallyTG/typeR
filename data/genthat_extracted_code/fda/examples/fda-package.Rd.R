library(fda)


### Name: fda-package
### Title: Functional Data Analysis in R
### Aliases: fda-package fda
### Keywords: smooth

### ** Examples

##
## As noted in the Preface to Ramsay, Hooker and Graves (p. v),
## the fda package includes scripts to reproduce all but one of the
## figures in the book.
##
## These figures can be found and run as follows:
##
## Not run: 
##D scriptsDir <- system.file('scripts', package='fda')
##D Rscripts <- dir(scriptsDir, full.names=TRUE, pattern='R$')
##D fdarm <- grep('fdarm', Rscripts, value=TRUE)
##D chapters <- length(fdarm)
##D # NOTE:  If R fails in any of these scripts,
##D # this for loop will not end normally,
##D # and the abnormal termination will be displayed:
##D for(ch in 1:chapters){
##D   cat('Running', fdarm[ch], '\n')
##D   invisible(source(fdarm[ch]))
##D }
## End(Not run)

##
## Simple smoothing
##
girlGrowthSm <- with(growth, smooth.basisPar(argvals=age, y=hgtf, lambda=0.1))
plot(girlGrowthSm$fd, xlab="age", ylab="height (cm)",
         main="Girls in Berkeley Growth Study" )
plot(deriv(girlGrowthSm$fd), xlab="age", ylab="growth rate (cm / year)",
         main="Girls in Berkeley Growth Study" )
plot(deriv(girlGrowthSm$fd, 2), xlab="age",
        ylab="growth acceleration (cm / year^2)",
        main="Girls in Berkeley Growth Study" )
##
## Simple basis
##
bspl1.2 <- create.bspline.basis(norder=1, breaks=c(0,.5, 1))
plot(bspl1.2)
# 2 bases, order 1 = degree 0 = step functions:
# (1) constant 1 between 0 and 0.5 and 0 otherwise
# (2) constant 1 between 0.5 and 1 and 0 otherwise.

fd1.2 <- Data2fd(0:1, basisobj=bspl1.2)
op <- par(mfrow=c(2,1))
plot(bspl1.2, main='bases')
plot(fd1.2, main='fit')
par(op)
# A step function:  0 to time=0.5, then 1 after




