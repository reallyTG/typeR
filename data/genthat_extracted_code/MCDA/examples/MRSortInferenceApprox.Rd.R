library(MCDA)


### Name: MRSortInferenceApprox
### Title: Identification of profiles, weights, majority threshold and veto
###   thresholds for MRSort using a genetic algorithm.
### Aliases: MRSortInferenceApprox
### Keywords: methods

### ** Examples

## Not run: 
##D performanceTable <- rbind(c(10,10,9), c(10,9,10), c(9,10,10), c(9,9,10), c(9,10,9), c(10,9,9),
##D                           c(10,10,7), c(10,7,10), c(7,10,10), c(9,9,17), c(9,17,9), c(17,9,9),
##D                           c(7,10,17), c(10,17,7), c(17,7,10), c(7,17,10), c(17,10,7), c(10,7,17),
##D                           c(7,9,17), c(9,17,7), c(17,7,9), c(7,17,9), c(17,9,7), c(9,7,17))
##D 
##D rownames(performanceTable) <- c("a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9", "a10", "a11",
##D                                 "a12", "a13", "a14", "a15", "a16", "a17", "a18", "a19", "a20",
##D                                 "a21", "a22", "a23", "a24")
##D 
##D colnames(performanceTable) <- c("c1","c2","c3")
##D 
##D assignments <-c("P", "P", "P", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F", "F",
##D                 "F", "F", "F", "F", "F", "F", "F")
##D 
##D names(assignments) <- rownames(performanceTable)
##D 
##D categoriesRanks <- c(1,2)
##D 
##D names(categoriesRanks) <- c("P","F")
##D 
##D criteriaMinMax <- c("max","max","max")
##D 
##D names(criteriaMinMax) <- colnames(performanceTable)
##D 
##D set.seed(1)
##D 
##D x<-MRSortInferenceApprox(performanceTable, assignments, categoriesRanks, 
##D                          criteriaMinMax, veto = TRUE,
##D                          alternativesIDs = c("a1","a2","a3","a4","a5","a6","a7"))
## End(Not run)



