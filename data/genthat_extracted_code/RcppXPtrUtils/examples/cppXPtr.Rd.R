library(RcppXPtrUtils)


### Name: cppXPtr
### Title: Define an 'XPtr' with a C++ Implementation
### Aliases: cppXPtr

### ** Examples

## No test: 
# takes time to compile
ptr <- cppXPtr("double foo(int a, double b) { return a + b; }")
class(ptr)
print(ptr)
## End(No test)



