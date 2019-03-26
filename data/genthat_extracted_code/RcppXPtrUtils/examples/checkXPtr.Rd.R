library(RcppXPtrUtils)


### Name: checkXPtr
### Title: Check an 'XPtr"s Signature
### Aliases: checkXPtr

### ** Examples

## No test: 
# takes time to compile
ptr <- cppXPtr("double foo(int a, double b) { return a + b; }")
checkXPtr(ptr, "double", c("int", "double")) # returns silently
checkXPtr(ptr, "int", c("double", "std::string")) # throws error
## End(No test)



