library(MCDA)


### Name: SRMPInferenceNoInconsistFixedLexicographicOrder
### Title: Exact inference of an SRMP model given the lexicographic order
###   of the profiles - no inconsistencies
### Aliases: SRMPInferenceNoInconsistFixedLexicographicOrder
### Keywords: methods

### ** Examples

## Not run: 
##D # the performance table
##D 
##D performanceTable <- rbind(c(10,10,9),c(10,9,10),c(9,10,10),c(9,9,10),c(9,10,9),c(10,9,9),
##D                           c(10,10,7),c(10,7,10),c(7,10,10),c(9,9,17),c(9,17,9),c(17,9,9),
##D                           c(7,10,17),c(10,17,7),c(17,7,10),c(7,17,10),c(17,10,7),c(10,7,17),
##D                           c(7,9,17),c(9,17,7),c(17,7,9),c(7,17,9),c(17,9,7),c(9,7,17))
##D 
##D lexicographicOrder <- c(2,1,3)
##D 
##D criteriaMinMax <- c("max","max","max")
##D 
##D rownames(performanceTable) <- c("a1","a2","a3","a4","a5","a6","a7","a8","a9","a10","a11","a12",
##D                                 "a13","a14","a15","a16","a17","a18","a19","a20","a21","a22",
##D                                 "a23","a24")
##D 
##D colnames(performanceTable) <- c("c1","c2","c3")
##D 
##D names(criteriaMinMax) <- colnames(performanceTable)
##D 
##D preferencePairs <- matrix(c("a16","a13","a3","a14","a17","a1","a18","a15","a2","a11","a5",
##D                             "a10","a4","a12","a13","a3","a14","a17","a1","a18","a15","a2",
##D                             "a11","a5","a10","a4","a12","a6"),14,2)
##D indifferencePairs <- matrix(c("a3","a1","a2","a11","a11","a20","a10","a10","a19","a12","a12",
##D                               "a21","a9","a7","a8","a20","a22","a22","a19","a24","a24","a21",
##D                               "a23","a23"),12,2)
##D 
##D result<-SRMPInferenceNoInconsistFixedLexicographicOrder(performanceTable, criteriaMinMax,
##D                                                         lexicographicOrder, preferencePairs,
##D                                                         indifferencePairs, alternativesIDs =
##D                                                         c("a1","a2","a3","a4","a5","a6","a7",
##D                                                         "a8","a10","a11","a12","a14","a16",
##D                                                         "a17","a18","a19","a20","a21","a23",
##D                                                         "a24"))
## End(Not run)


