library(stdvectors)


### Name: stdvectors-package
### Title: C++ Standard Library Vectors in R
### Aliases: stdvectors-package stdvectors
### Keywords: package manip iteration programming

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

  ## Not run: 
##D   
##D     # check the time difference:
##D     # the first method takes around 2-3 s
##D     # the second method takes less than 0.1 s
##D     system.time({
##D         v <- integer()
##D         for(i in 1:100000){
##D           v[[length(v)+1]] <- i
##D         }
##D       }
##D     )
##D     system.time({
##D         v <- stdvectorCreate('integer')
##D         for(i in 1:100000){
##D           stdvectorPushBack(v,i)
##D         }
##D       }
##D     )
##D 
##D   
## End(Not run)



