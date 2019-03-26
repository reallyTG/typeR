library(EMT)


### Name: plotMultinom
### Title: Plot the Probability distribution fot the Exact Multinomial Test
### Aliases: plotMultinom
### Keywords: htest multivariate

### ** Examples


## Load the EMT package:
library(EMT)


## input and calculation of p-values:
observed <- c(5,2,1)   		
prob <- c(0.25, 0.5, 0.25) 	
out <- multinomial.test(observed, prob)        


## Plot the probability distribution:
plotMultinom(out)
plotMultinom(out, showmax = 30)  # suppress part of the tail in the plot 




