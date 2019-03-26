library(fitDRC)


### Name: Transformations
### Title: The class 'transformation' in the fitDRC package: its
###   constructors and methods.
### Aliases: transformation trans.tan.create trans.arctan.create
###   trans.dil.create trans.log.create trans.exp.create
###   print.transformation summary.transformation plot.transformation
###   TRANS.RANGE.X TRANS.RANGE.Y TRANS.FORW TRANS.BACKW TRANS.DERIV
### Keywords: transformation of distribution

### ** Examples

trans.arctan <- trans.arctan.create(c(0,10))
print(trans.arctan)
summary(trans.arctan)
#x11()
#plot(trans.arctan)
#plot(trans.arctan,what = "TRANS.BACKW")
#plot(trans.arctan,what = "TRANS.DERIV")

trans.tan <- trans.tan.create(c(0,10))
#x11()
#plot(trans.tan)
#plot(trans.tan,what = "TRANS.BACKW")
#plot(trans.tan,what = "TRANS.DERIV")

trans.log <- trans.log.create()
#x11()
#plot(trans.log,range.x=c(-1,1))
#plot(trans.log,what = "TRANS.BACKW",range.y=c(-1,1))
#plot(trans.log,what = "TRANS.DERIV",range.x=c(-1,1))

trans.dil <- trans.dil.create(c(0,1,4,5))
#x11()
#plot(trans.dil,range.x=c(-1,1))
#plot(trans.dil,what = "TRANS.BACKW", range.y = c(-1,1))
#plot(trans.dil,what = "TRANS.DERIV", range.x = c(-1,1))

trans.exp <- trans.exp.create(c(3, 2, 1))
#x11()
#plot(trans.exp,range.x=c(-1,1))
#plot(trans.exp,what = "TRANS.BACKW", range.y = c(-4,3))
#plot(trans.exp,what = "TRANS.DERIV", range.x = c(-1,1))

# implemented default values are:
trans.arctan.create(par = c(Min = 0, Max = 1))
trans.tan.create(par = c(Min = 0, Max = 1))
trans.dil.create(par = c("Min1" = 0, "Max1" = 1, "Min2" = 0, "Max2" = 1))
trans.log.create(par = c("-" = NA))
trans.exp.create(par = c("a" = 0, "b" = 1, "c" = 0))


##############################################################################
      ### if you want to create your own transformation read this ###
##############################################################################

# use the template below and replace the code in between *<* ... *>*
# accordingly. Do not forget to delete the *<* and *>* that are only used to
# indicate the custom fields.
# type 'trans.exp.create' to see an already implemented transformation.

################################################################################
### if you want to create your own transformation use the following template ###
################################################################################

# trans.*<*yournameofyourtransformation*>*.create <- function(par=c(NA)
# {
#   # set default parameter values:
#   par.default <- c(*<*NA,...*>*)
#   names(par.default) <- c(*<*"a",...*>*)
#   p <- mergePar(par,par.default)
#   # construct class:
#   trans             <- list()
#   trans$name        <- "*<*yourname"*>*
#   trans$range.x     <- function(par){*<*return(c(min.x,max.x))*>*}
#   trans$range.y     <- function(par){*<*return(c(min.y,max.y))*>*}
#   trans$par.names   <- names(p)
#   # ranges of the parameters of the transformation
#   trans$par.ranges  <- matrix(
#                               c(*<*-NA, +NA*>*,      # range of 1st parameter
#                                 *<*-NA, +NA*>*),     # range of 2nd par.....
#                               byrow=TRUE,ncol=2)
#   trans$par         <- p
#   trans$trans.forw  <- function(x,par)
#                        { y <- *<*yourForwardFormula(x,par)*>*
#                          return(as.numeric(y))
#                        }
#   trans$trans.backw <- function(y,par)
#                        { x <- *<*yourBackwardFormula(y,par)*>*
#                          return(as.numeric(x)) }
#   trans$trans.deriv <- function(x,par)
#                        { dydx <- *<*yourDerivationFormula(x,par)*>*
#                          return(as.numeric(dydx)) }
#   class(trans)      <- "transformation"
#   return(trans)
# }




