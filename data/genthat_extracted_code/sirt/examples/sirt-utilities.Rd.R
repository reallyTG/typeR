library(sirt)


### Name: sirt-utilities
### Title: Utility Functions in 'sirt'
### Aliases: sirt-utilities tracemat pow soft_thresholding
###   hard_thresholding bounds_parameters dimproper ginverse_sym
###   sirt_rbind_fill sirt_fisherz sirt_antifisherz
###   sirt_attach_list_elements sirt_summary_print_objects
###   sirt_summary_print_package_rsession sirt_summary_print_package
###   sirt_summary_print_rsession sirt_summary_print_call sirt_optimizer

### ** Examples

#############################################################################
## EXAMPLE 1: Trace of a matrix
#############################################################################

set.seed(86)
A <- matrix( stats::runif(4), 2,2 )
tracemat(A)
sum(diag(A))    #=sirt::tracemat(A)

#############################################################################
## EXAMPLE 2: Power function
#############################################################################

x <- 2.3
a <- 1.7
pow(x=x,a=a)
x^a            #=sirt::pow(x,a)

#############################################################################
## EXAMPLE 3: Soft and hard thresholding function (e.g. in LASSO estimation)
#############################################################################

x <- seq( -2, 2, length=100 )
y <- sirt::soft_thresholding( x, lambda=.5)
graphics::plot( x, y, type="l")

z <- sirt::hard_thresholding( x, lambda=.5)
graphics::lines( x, z, lty=2, col=2)

#############################################################################
## EXAMPLE 4: Bounds on parameters
#############################################################################

pars <- c( .721, .346 )
bounds_parameters( pars=pars, lower=c(-Inf, .5), upper=c(Inf,1) )



