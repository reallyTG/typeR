library(HandTill2001)


### Name: auc-methods
### Title: Methods for Function 'auc' in Package 'HandTill2001'
### Aliases: auc-methods auc auc,bincap-method auc,multcap-method
### Keywords: methods auc

### ** Examples

library(HandTill2001)
data(ht01.twoclass)
data(ht01.multipleclass)
message(" == AUC for a two class response")
## Not run: 
##D message(" == == ROCR result:")
##D library(ROCR)
##D performance(prediction(labels=ht01.twoclass$observed
##D                        , predictions=ht01.twoclass$predicted
##D                        )
##D             , measure = "auc")
## End(Not run)
message(" == == HandTill2001 result:")
auc(bincap(
	    response = as.factor(ht01.twoclass$observed)
	    , predicted = ht01.twoclass$predicted
	    , true = "1"
	    ))
message(" == AUC for a multiple class response")
auc(multcap(
	     response = ht01.multipleclass$observed
	     , predicted = as.matrix(ht01.multipleclass[, levels(ht01.multipleclass$observed)])
	     ))



