library(galgo)


### Name: specificityClass.BigBang
### Title: Computes the specificity of class prediction
### Aliases: specificityClass.BigBang BigBang.specificityClass
###   specificityClass.BigBang specificityClass,BigBang-method
###   specificityClass
### Keywords: methods internal methods

### ** Examples
## Not run: 
##D    #bb is a BigBang object
##D    cpm <- classPredictionMatrix(bb)
##D    cpm
##D    cm <- confusionMatrix(bb)
##D    cm
##D    #equivalent and quicker because classPredictionMatrix is provided
##D    cm <- confusionMatrix(bb, cpm)
##D    cm
##D  
##D    specificityClass(bb, cm)
##D    specificityClass(bb, cpm)
##D    specificityClass(bb)
##D    # all are equivalent
##D    sensitivityClass(bb, cpm)
##D    sensitivityClass(bb, cm)
##D    sensitivityClass(bb)
##D    # all are equivalent
##D    
## End(Not run)
 


