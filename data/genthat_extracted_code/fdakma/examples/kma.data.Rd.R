library(fdakma)


### Name: kma.data
### Title: Simulated Data
### Aliases: kma.data

### ** Examples

data(kma.data)

x <- kma.data$x # abscissas
y0 <- kma.data$y0 # evaluations of original functions
y1 <- kma.data$y1 # evaluations of original function first derivatives

## Not run: 
##D # Plot of original functions
##D matplot(t(x),t(y0), type='l', xlab='x', ylab='orig.func')
##D title ('Original functions')
##D 
##D # Plot of original function first derivatives
##D matplot(t(x),t(y1), type='l', xlab='x', ylab='orig.deriv')
##D title ('Original function first derivatives')
## End(Not run)



