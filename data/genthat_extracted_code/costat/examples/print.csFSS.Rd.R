library(costat)


### Name: print.csFSS
### Title: Print a'csFSS' object.
### Aliases: print.csFSS
### Keywords: ts

### ** Examples

#
# Create dummy data
#
x1 <- rnorm(32)
y1 <- rnorm(32)
#
# Find stationary combinations. Note: normally Nsims would be much bigger
#
## Not run: ans <- findstysols(Nsims=100, tsx=x1, tsy=y1)
#
# Print this csFSS object
#
## Not run: print(ans)
#Class 'csFSS' : Stationary Solutions Object from costat:
#       ~~~~~  : List with 13 components with names
#              startpar endpar convergence minvar pvals tsx tsy tsxname tsyname filter.number
#              family spec.filter.number spec.family 
#
#
#summary(.):
#----------
#Name of X time series:  x1 
#Name of Y time series:  y1 
#Length of input series:  32 
#There are  100  sets of solutions
#Each solution vector is based on  3  coefficients
#Some solutions did not converge, check convergence component for more information.
#Zero indicates successful convergence, other values mean different things and
#you should consult the help page for `optim' to discover what they mean
#For size level:  0.05 
#        0  solutions appear NOT to be stationary
#        97  solutions appear to be stationary
#Range of p-values: ( 0.885 , 0.975 )
#
#Wavelet filter for combinations:  1   DaubExPhase 
#Wavelet filter for spectrum:  1   DaubExPhase 



