library(fitDRC)


### Name: Distributions
### Title: The class 'distribution' in the fitDRC-package: its constructors
###   and methods.
### Aliases: distribution dist.normal.create dist.student.create
###   dist.weibull.create dist.lognormal.create dist.beta.create
###   dist.gamma.create dist.f.create dist.uniform.create
###   dist.logistic.create print.distribution summary.distribution
###   plot.distribution PDF.distribution CDF.distribution
###   CDFinv.distribution RANGE.distribution MEAN.distribution
###   SD.distribution MEDIAN.distribution MODE.distribution
### Keywords: distribution

### ** Examples

print(dist.normal.create(c(Mean = 0, StDev = 1)))
print(dist.student.create(c(DF=99)))
dist.weibull.create(c(Shape=2,Scale=99))
summary(dist.lognormal.create(c(StDev=2)))

plot(dist.beta.create(c(2,1)),plot=FALSE)
plot(dist.gamma.create(c(2,1)),main="myGamma",xlab="x",ylab="pdf")
plot(dist.f.create(c(ncp=99)),main="F",what="CDF",xlab="x",ylab="cdf")
plot(dist.uniform.create(c(-1,1)),main="Uniform",what="CDFinv",xlab="p",ylab="inv-cdf")
plot(dist.logistic.create(c(2,1)),par=c(Scale=5))

dist.normal <- dist.normal.create(c(StDev=2))
is(dist.normal)                       # element of class distribution
plot(dist.normal,par=c(StDev=3))
dist.normal$par <- c(2,2)             # "permanent" parameter change
plot(dist.normal)
plot(dist.normal, par = c(Mean = 0))  # "temporary" parameter change

# Default setting of the parameters:

dist.normal.create(par = c(Mean = 0, StDev = 1))
dist.student.create(par = c("Mean" = 0, "StDev" = 1, "DF" = 3))
dist.weibull.create(par = c( "Shape" = 2, "Scale" = 2 ))
dist.lognormal.create(par = c("Mean" = 1, "StDev" = 1))
dist.beta.create(par = c("Shape1" = 1, "Shape2" = 1))
dist.gamma.create(par = c("shape" = 1, "rate" = 1))
dist.f.create(par = c("df1" = 3,"df2" = 5, "ncp" = 0))
dist.uniform.create(par= c("Min" = 0, "Max" = 1))
dist.logistic.create(par = c("Location" = 0,"Scale" = 1))



##############################################################################
       ### if you want to create your own distribution read this ###
##############################################################################

# use the template below and replace the code in between *<* ... *>*
# accordingly. Do not forget to delete the *<* and *>* that are only used to
# indicate the custom fields.
# type 'dist.normal.create' to see an already implemented distribution.

##############################################################################
### if you want to create your own distribution use the following template ###
##############################################################################

# dist.*<*YourDistributionFamilyName*>*.create <- function(par=NA)
# {
#   # set default parameter values:
#   par.default <- c(*<*YourFirstParamterDefaulValue, ...*>*)
#   names(par.default) <- c( *<*"YourParameterNameOfYourFirstParamter", "..."*>* )
#   p <- mergePar(par,par.default)
#   # construct class:
#   dist            <- list()
#   dist$name       <- "*<*YourDistributionName*>*"
#   dist$range      <- function(par) # range of the distribution
#                      {
#                         return(c(*<*YourLowerRange,YourUperRange*>*))
#                     }
#   dist$par.names  <- names(p)
#   dist$par.ranges <- matrix(
#                             c(*<*-NA, +NA,*>*      # ranges of par01
#                               *<*-NA, +NA*>*),     # ...
#                               byrow=TRUE,ncol=2)
#   dist$par        <- p
#   dist$mean       <- function(par)
#                      {
#                         mean <- *<*MeanFormula(par)*>*
#   	                  names(mean) <- "Mean"
#   	                  return(mean)
#   	                  }
#   dist$sd         <- function(par) 
#                      {
#                      	 sd <- *<*StandardDevFormula(par)*>* 
#                        names(sd) <- "StDev"
#                        return(sd)
#                      }
#   dist$median     <- function(par)
#                      { 
#                        median <- *<*MedianFormula(par)*>*
#                      	 names(median) <- "Median"
#                      	 return(median)
#                      }
#   dist$mode       <- function(par)
#                     { 
#                      	 mode <- *<*ModeFormula(par)*>*
#                        names(mode) <- "Mode"
#                        return(mode)
#                      }
#   dist$pdf        <- function(x,par) { return( *<*dyourdist(x, par)*>* ) }
#   dist$cdf        <- function(x,par) { return( *<*pyourdist(x, par)*>* ) }
#   dist$cdf.inv    <- function(p,par) { return( *<*qyourdist(p, par)*>* ) }
#   class(dist)     <- "distribution"
#   return(dist)
#}




