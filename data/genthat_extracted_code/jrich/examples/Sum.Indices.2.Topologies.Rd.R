library(jrich)


### Name: Sum.Indices.2.Topologies
### Title: Sums two tables with indices values.
### Aliases: Sum.Indices.2.Topologies

### ** Examples


 ## get the library
 library(jrich)
 
 ## load the data
 data(Multitaxon1) 
 
 ## calculate indices for two trees and their distributions
 temp.Index.Value1 <- Calculate.Index(tree = Multitaxon1[[1]][[1]],
                                      distribution = Multitaxon1[[1]][[2]],0)

 temp.Index.Value2 <- Calculate.Index(tree = Multitaxon1[[2]][[1]],
                                      distribution = Multitaxon1[[2]][[2]],0)
 
 ## sum the indices values
 Sum.Indices.2.Topologies(temp.Index.Value1, temp.Index.Value2)
 




