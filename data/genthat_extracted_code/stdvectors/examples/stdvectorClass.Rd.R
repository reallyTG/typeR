library(stdvectors)


### Name: stdvectorClass
### Title: std::vector R wrapper
### Aliases: stdvectorCreate stdvectorPushBack stdvectorSize stdvectorClear
###   stdvectorToVector stdvectorSubset stdvectorReplace stdvectorErase
###   stdvectorClone is.stdvector print.stdvector toString.stdvector

### ** Examples

  # create a stdvector
  sv <- stdvectorCreate('integer')
  # add 100 values to it
  for(i in 1:100){
    # note that sv is modified in-place
    stdvectorPushBack(sv,i)
  }
  # get a normal R vector from the stdvector
  v <- stdvectorToVector(sv)




