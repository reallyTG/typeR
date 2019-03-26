library(liquidSVM)


### Name: read.liquidSVM
### Title: Read and Write Solution from and to File
### Aliases: read.liquidSVM write.liquidSVM serialize.liquidSVM
###   unserialize.liquidSVM

### ** Examples

## Not run: 
##D banana <- liquidData('banana-bc')
##D modelOrig <- mcSVM(Y~., banana$train)
##D write.liquidSVM(modelOrig, "banana-bc.fsol")
##D write.liquidSVM(modelOrig, "banana-bc.sol")
##D clean(modelOrig) # delete the SVM object
##D 
##D # now we read it back from the file
##D modelRead <- read.liquidSVM("banana-bc.fsol")
##D # No need to train/select the data!
##D errors(test(modelRead, banana$test))
##D 
##D # to read the model where no data was saved we have to make sure, we get the same training data:
##D banana <- liquidData('banana-bc')
##D # then we can read it
##D modelDataExternal <- read.liquidSVM("banana-bc.sol", Y~., banana$train)
##D result <- test(modelDataExternal, banana$test)
##D 
##D # to serialize an object use:
##D banana <- liquidData('banana-bc')
##D modelOrig <- mcSVM(Y~., banana$train)
##D # we serialize it into a raw vector
##D obj <- serialize.liquidSVM(modelOrig)
##D clean(modelOrig) # delete the SVM object
##D 
##D # now we unserialize it from that raw vector
##D modelUnserialized <- unserialize.liquidSVM(obj)
##D errors(test(modelUnserialized, banana$test))
## End(Not run)



