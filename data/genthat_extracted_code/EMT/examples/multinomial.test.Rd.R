library(EMT)


### Name: multinomial.test
### Title: Exact Multinomial Test: Goodness-of-Fit Test for Discrete
###   Multivariate data
### Aliases: multinomial.test
### Keywords: htest multivariate

### ** Examples


## Load the EMT package:
library(EMT)


## Input data for a three-dimensional case:
observed <- c(5,2,1)   		# observed data: 5 items in category one, 2 items in category two, 1 item in category three
prob <- c(0.25, 0.5, 0.25) 	# model: hypothetical probability that an item falls into category one, two, or three


## Calculate p-value using default options:
out <- multinomial.test(observed, prob)        
# p.value = 0.0767


## Plot the probabilities for each event:
plotMultinom(out)


## Calculate p-value for the same input using Pearson's chisquare as a distance measure:
out <- multinomial.test(observed, prob, useChisq = TRUE)  
# p.value = 0.0596 ; not the same!


## Test the hypothesis that all sides of a dice pop up with the same probability (a 6-dimesional problem):
pdice = 1/6
prob <- c(pdice, pdice, pdice, pdice, pdice, pdice)	# the model, determined by the hypothetical probabilities
observed <- c(4, 5, 2, 7, 0, 1)				# the observation consisting of 19 throws ( = sample size)
out <- multinomial.test(observed, prob) 
# p.value = 0.0357 ; better get another dice, this one seems to be biased
plotMultinom(out, showmax = 10000)   


# the same problem using a Monte Carlo approach:
# we have about 40.000 outcomes and choose at least 400000 trials (probably to be increased):
out <- multinomial.test(observed, prob, MonteCarlo = TRUE, ntrial = 400000)   
# p.value = 0.0343 ; takes a few minutes on a laptop with 2 GB memory, 1.5 GHz speed
plotMultinom(out, showmax = 5000)  




