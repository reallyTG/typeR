library(costat)


### Name: findstysols
### Title: Given two time series find some time-varying linear combinations
###   that are stationary.
### Aliases: findstysols
### Keywords: ts

### ** Examples

#
# Find some stationary solutions with \code{Ncoefs=3}.
#
# Note: this is a toy example
#
tsx1 <- rnorm(32)	# A x time series
tsy1 <- rnorm(32)	# A y time series
#
# Find costationary solutions, but only from 2 random starts
#
# Typically, the length of tsx and tsy would be bigger (eg sret, fret are
# other examples you might use). Also, Nsims would be bigger, you need
# to use many random starts to ensure good coverage of the solution
# space, e.g. Nsims=100
#
# Note: the following examples are not run so as to adhere to CRAN
# requirements for package execution timings
#
## Not run: ans <- findstysols(Nsims=3, tsx=tsx1, tsy=tsy1)
#
# Print out a summary of the results
#
## Not run: ans
#Class 'csFSS' : Stationary Solutions Object from costat:
#       ~~~~~  : List with 13 components with names
#              startpar endpar convergence minvar pvals tsx tsy tsxname tsyname
#		filter.number family spec.filter.number spec.family 
#
#
#summary(.):
#----------
#Name of X time series:  tsx1 
#Name of Y time series:  tsy1 
#Length of input series:  32 
#There are  3  sets of solutions
#Each solution vector is based on  3  coefficients
#Some solutions did not converge, check convergence component for more information.
#Zero indicates successful convergence, other values mean different things and
#you should consult the help page for `optim' to discover what they mean
#For size level:  0.05 
#	 0  solutions appear NOT to be stationary
#	 3  solutions appear to be stationary
#Range of p-values: ( 0.93 , 0.995 )
#
#Wavelet filter for combinations:  1   DaubExPhase 
#Wavelet filter for spectrum:  1   DaubExPhase 
#
#______________
#
# Ok. The printout above suggests that some solutions did not converge.
# Which ones?
#
## Not run: ans$convergence
# [1] 0 1 0 
#
# The second one did not converge, the others did. Good. The printout
# above also indicates that all the resultant solutions were stationary
# (this is not surprising for this example, as the inputs tsx1 and tsy1
# are stationary, and indeed iid).
#
# Let's see how the solutions compare. For example, let's plot the
# hierarchical cluster analysis of the final solutions (those that
# converged and are stationary)
#
## Not run: plot(ans, ALLplotscale=FALSE)
#
# My cluster shows that solution 1 and 3 are similar. Let's
# view solution 3.
#
## Not run: oldpar <- par(mfrow=c(2,2))
## Not run: plot(ans, solno=3)
## Not run: par(oldpar)



