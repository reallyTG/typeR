library(NMF)


### Name: NMF-class
### Title: Generic Interface for Nonnegative Matrix Factorisation Models
### Aliases: .DollarNames,NMF-method misc NMF-class $<-,NMF-method
###   $,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# show all the NMF models available (i.e. the classes that inherit from class NMF)
nmfModels()
# show all the built-in NMF models available
nmfModels(builtin.only=TRUE)

# class NMF is a virtual class so cannot be instantiated:
try( new('NMF') )

# To instantiate an NMF model, use the factory method nmfModel. see ?nmfModel
nmfModel()
nmfModel(3)
nmfModel(3, model='NMFns')



