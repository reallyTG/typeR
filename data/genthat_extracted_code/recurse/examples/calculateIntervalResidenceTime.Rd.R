library(recurse)


### Name: calculateIntervalResidenceTime
### Title: Calculates residence time within user-specified breaks
### Aliases: calculateIntervalResidenceTime

### ** Examples

data(martin)
revisits = getRecursions(martin, radius = 1)
breaks = strptime(c("2000-01-01 00:00:00", "2000-01-15 00:00:00", "2000-02-01 00:00:00"), 
format = "")
intervalResTime = calculateIntervalResidenceTime(revisits, breaks)




