library(pastecs)


### Name: regul.adj
### Title: Adjust regulation parameters
### Aliases: regul.adj
### Keywords: ts chron

### ** Examples

# This example follows the example for regul.screen()
# where we determined that xmin=9, deltat=21, n=63, with tol=1.05
# is a good choice to regulate the irregular time series in 'releve' 
data(releve)
regul.adj(releve$Day, xmin=9, deltat=21)
# The histogram indicates that it is not useful to increase tol
# more than 1.05, because few observations will be added
# except if we increase it to 5-7, but this value could be
# considered to be too large in comparison with deltat=22
# On the other hand, with tol <= 1, the number of matching
# observations will be almost divided by two!



