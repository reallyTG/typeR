library(compboost)


### Name: LossCustomCpp
### Title: Create custom cpp losses by using cpp functions and external
###   pointer.
### Aliases: LossCustomCpp

### ** Examples

## No test: 
# Load loss functions:
Rcpp::sourceCpp(code = getCustomCppExample(example = "loss", silent = TRUE))

# Create new custom quadratic loss:
my.cpp.loss = LossCustomCpp$new(lossFunSetter(), gradFunSetter(), constInitFunSetter())
## End(No test)



