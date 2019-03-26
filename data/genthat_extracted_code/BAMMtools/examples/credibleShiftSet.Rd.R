library(BAMMtools)


### Name: credibleShiftSet
### Title: Credible set of macroevolutionary rate shift configurations from
###   'BAMM' results
### Aliases: credibleShiftSet
### Keywords: models

### ** Examples

data(events.whales, whales)
ed <- getEventData(whales, events.whales, burnin=0.1, nsamples=500)

cset <- credibleShiftSet(ed, expectedNumberOfShifts = 1, threshold = 5)

# Here is the total number of samples in the posterior:
length(ed$eventData)

# And here is the number of distinct shift configurations:
cset$number.distinct

# here is the summary statistics:
summary(cset)

# Accessing the raw frequency vector for the credible set:
cset$frequency

#The cumulative frequencies:
cset$cumulative

# The first element is the shift configuration with the maximum 
#  a posteriori probability. We can identify all the samples from 
#  posterior that show this shift configuration:

cset$indices[[1]]

# Now we can plot the credible set:
plot(cset, plotmax=4)



