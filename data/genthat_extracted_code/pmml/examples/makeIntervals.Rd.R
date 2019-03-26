library(pmml)


### Name: makeIntervals
### Title: Create Interval elements, most likely to add to a DataDictionary
###   element
### Aliases: makeIntervals

### ** Examples

# make 3 Interval elements
# we define the 3 Intervals as ,1]  (1,2)  and [2, 
mi<-makeIntervals(list("openClosed","openOpen","closedOpen"),
                   list(NULL,1,2),list(1,2,NULL))




