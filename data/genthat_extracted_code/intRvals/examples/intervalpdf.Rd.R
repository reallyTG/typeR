library(intRvals)


### Name: intervalpdf
### Title: Probability density function of an observed interval
###   distribution
### Aliases: intervalpdf

### ** Examples

# a low probability of not observing an arrival
# results in an observed PDF with primarily
# a single peak, with a mean and standard
# deviation almost identical to the true interval
# distribution:
plot(intervalpdf(mu=200,sigma=40,p=0.01),type='l',col='red')

# a higher probability to miss an arrival
# results in an observed PDF with multiple
# peaks at integer multiples of the mean of the true
# interval distribution
plot(intervalpdf(mu=200,sigma=40,p=0.4),type='l',col='red')



