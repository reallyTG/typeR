library(microsamplingDesign)


### Name: getCombinationsWithMaxNRepetitions
### Title: get all combinations with a maximum number of repetitions
### Aliases: getCombinationsWithMaxNRepetitions

### ** Examples

test1    <-  getCombinationsWithMaxNRepetitions( c("a" , "b" , "c" ) ,
 nDraws = 2, maxRepetitions = 2 )
test2    <-  getCombinationsWithMaxNRepetitions( 1:5 , nDraws = 3, maxRepetitions = 3 )
test3    <-  getCombinationsWithMaxNRepetitions( 1:5 , nDraws = 3, maxRepetitions = 3 ,
 nCombinationsOnly = TRUE  )



