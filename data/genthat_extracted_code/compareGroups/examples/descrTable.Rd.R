library(compareGroups)


### Name: descrTable
### Title: Perform descriptives and build the bivariate table.
### Aliases: descrTable
### Keywords: misc

### ** Examples


require(compareGroups)

# load REGICOR data
data(regicor)

# perform descriptives by year and build the table.
# note the use of arguments from compareGroups (formula and data set) and
# arguments from createTable (hide.no and show.p.mul)
descrTable(year ~ ., regicor, hide.no="no", show.p.mul=TRUE)




