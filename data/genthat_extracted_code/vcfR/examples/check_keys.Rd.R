library(vcfR)


### Name: check_keys
### Title: Check that INFO and FORMAT keys are unique
### Aliases: check_keys

### ** Examples

data(vcfR_test)
check_keys(vcfR_test)
queryMETA(vcfR_test)
queryMETA(vcfR_test, element = 'DP')
# Note that DP occurs as unique in INFO and FORMAT but they may be different.





