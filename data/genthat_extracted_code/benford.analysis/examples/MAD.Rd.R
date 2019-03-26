library(benford.analysis)


### Name: MAD
### Title: Gets the MAD of a Benford object
### Aliases: MAD

### ** Examples

data(census.2000_2010) #gets data
c2010 <- benford(census.2000_2010$pop.2010) #generates benford object
MAD(c2010) #equivalent to c2010$MAD



