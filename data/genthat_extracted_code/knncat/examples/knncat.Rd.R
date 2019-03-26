library(knncat)


### Name: knncat
### Title: Build a knncat classifier
### Aliases: knncat
### Keywords: models

### ** Examples

## Not run: 
##D data ("synth.tr", package="MASS")
##D data ("synth.te", package="MASS")
##D syncat <- knncat (synth.tr, classcol=3)
##D syncat
##D Train set misclass rate: 12.8##D 
##D 
##D synpred <- predict (syncat, synth.tr, synth.te, train.classcol=3,
##D                     newdata.classcol=3)
##D table (synpred, synth.te$yc)
##D        
##D synpred 0   1  
##D       0 460  91
##D       1  40 409
##D #
##D # Or do the whole thing in one pass:
##D #
##D 
##D knncat (synth.tr, synth.te, classcol=3)
##D Test set misclass rate: 13.1##D 
## End(Not run)



