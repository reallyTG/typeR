library(abc)


### Name: cv4abc
### Title: Cross validation for Approximate Bayesian Computation (ABC)
### Aliases: cv4abc
### Keywords: htest models

### ** Examples

require(abc.data)
data(musigma2)
## this data set contains five R objects, see ?musigma2 for
## details 

## cv4abc() calls abc(). Here we show two ways for the supplying
## arguments of abc(). 1st way: passing arguments directly. In this
## example only 'param', 'sumstat', 'tol', and 'method', while default
## values are used for the other arguments.
## Number of eval. should be much more greater in realistic settings
cv.rej <- cv4abc(param=par.sim, sumstat=stat.sim, nval=5,
tols=c(.1,.2,.3), method="rejection")

## 2nd way: first creating an object of class 'abc', and then using it
## to pass its arguments to abc().
##
lin <- abc(target=stat.obs, param=par.sim, sumstat=stat.sim, tol=.2,
method="loclinear", transf=c("none","log"))
cv.lin <- cv4abc(param=par.sim, sumstat=stat.sim, abc.out=lin, nval=5,
tols=c(.1,.2,.3))

## using the plot method. Different tolerance levels are plotted with
## different heat.colors. Smaller the tolerance levels correspond to
## "more red" points.
## !!! consider using the argument 'exclude' (plot.cv4abc) to supress
## the plotting of any outliers that mask readibility !!!
plot(cv.lin, log=c("xy", "xy"), caption=c(expression(mu),
expression(sigma^2)))

## comparing with the rejection sampling
plot(cv.rej, log=c("", "xy"), caption=c(expression(mu), expression(sigma^2)))

## or printing results directly to a postscript file...
plot(cv.lin, log=c("xy", "xy"), caption=c(expression(mu),
expression(sigma^2)), file="CVrej", postscript=TRUE)

## using the summary method to calculate the prediction error
summary(cv.lin)
## compare with rejection sampling
summary(cv.rej)



