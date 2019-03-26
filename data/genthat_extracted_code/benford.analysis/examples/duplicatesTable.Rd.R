library(benford.analysis)


### Name: duplicatesTable
### Title: Shows the duplicates of the data
### Aliases: duplicatesTable

### ** Examples

data(census.2009) #gets data
c2009 <- benford(census.2009$pop.2009) #generates benford object
duplicatesTable(c2009)



