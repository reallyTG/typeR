library(arulesSequences)


### Name: timeFrequency-methods
### Title: Count Event Times
### Aliases: firstOrder firstOrder,timedsequences-method timeFrequency
###   timeFrequency,timedsequences-method timeTable
###   timeTable,timedsequences-method
### Keywords: models

### ** Examples

## continue example
example("timedsequences-class")

## totals
timeFrequency(z)
timeFrequency(z, "gaps")
timeFrequency(z, "span")

## default items
timeTable(z)
timeTable(z, "gaps")
timeTable(z, "span")

## beware of large data sets
timeTable(z, itemsets = TRUE)


## first order models
firstOrder(z)
firstOrder(z, times = TRUE)



