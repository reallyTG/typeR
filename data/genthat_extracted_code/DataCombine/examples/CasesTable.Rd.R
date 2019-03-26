library(DataCombine)


### Name: CasesTable
### Title: Create reports cases after listwise deletion of missing values
###   for time-series cross-sectional data.
### Aliases: CasesTable

### ** Examples

# Create dummy data
ID <- rep(1:4, 4)
time <- rep(2000:2003, 4)
a <- rep(c(1:3, NA), 4)
b <- rep(c(1, NA, 3:4), 4)
Data <- data.frame(ID, time, a, b)

# Find cases that have not been listwise deleted
CasesTable(Data, GroupVar = 'ID')
CasesTable(Data, GroupVar = 'ID', Vars = 'a')
CasesTable(Data, GroupVar = 'ID', TimeVar = 'time', Vars = 'a')





