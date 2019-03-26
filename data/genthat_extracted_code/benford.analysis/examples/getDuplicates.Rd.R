library(benford.analysis)


### Name: getDuplicates
### Title: Gets the duplicates from data
### Aliases: getDuplicates

### ** Examples

data(census.2000_2010) #gets data
c2010 <- benford(census.2000_2010$pop.2010) #generates benford object
duplicates <- getDuplicates(c2010, census.2000_2010)



