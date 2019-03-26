library(careless)


### Name: longstring
### Title: Identifies the longest string of identical consecutive responses
###   for each observation
### Aliases: longstring

### ** Examples

careless_long <- longstring(careless_dataset, avg = FALSE)
careless_avg <- longstring(careless_dataset, avg = TRUE)
boxplot(careless_avg$longstr) #produce a boxplot of the longstring index
boxplot(careless_avg$avgstr)



