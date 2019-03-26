library(benford.analysis)


### Name: chisq
### Title: Gets the Chi-squared test of a Benford object
### Aliases: chisq

### ** Examples

data(census.2009) #gets data
c2009 <- benford(census.2009$pop.2009) #generates benford object
chisq(c2009) # equivalent to c2009$stats$chisq



