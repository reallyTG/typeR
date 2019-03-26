library(dataPreparation)


### Name: generateDateDiffs
### Title: Date difference
### Aliases: generateDateDiffs

### ** Examples

# First build a useful dataSet set
require(data.table)
dataSet <- data.table(ID = 1:100, 
                  date1 = seq(from = as.Date("2010-01-01"), 
                              to = as.Date("2015-01-01"), 
                              length.out = 100), 
                  date2 = seq(from = as.Date("1910-01-01"), 
                              to = as.Date("2000-01-01"), 
                              length.out = 100)
                  )

# Now let's compute
dataSet <- generateDateDiffs(dataSet, cols = "auto", analysisDate = as.Date("2016-11-14"))



