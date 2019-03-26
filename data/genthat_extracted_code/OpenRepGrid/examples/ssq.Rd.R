library(OpenRepGrid)


### Name: ssq
### Title: Calculate SSQ (accuracy) of biplot representation for elements
###   and constructs.
### Aliases: ssq
### Keywords: internal

### ** Examples


 # explained sum-of-squares for elements
 ssq(bell2010)
 
 # explained sum-of-squares for constructs
 ssq(bell2010, along=1)
 
 # save results
 s <- ssq(bell2010)
 
 # printing options
 print(s)
 print(s, digits=4)
 print(s, dim=3)
 print(s, cumulated=FALSE)
 
 # access results
 names(s)
 s$ssq.table
 s$ssq.table.cumsum
 s$ssq.total
 



