library(roperators)


### Name: %~=%
### Title: Floating point comparison operators
### Aliases: %~=% %>~% %<~%

### ** Examples

 ## Floating point test of equality ####

 # Basic Equality - no roperators:
 (0.1 + 0.1 + 0.1) == 0.3   # FALSE
 # Basic Equality - with roperators:
 (0.1 + 0.1 + 0.1) %~=% 0.3 # TRUE


 # NOTE: for floating point >= and <=
 (0.1 + 0.1 + 0.1) %>=% 0.3 # TRUE
 (0.1 + 0.1 + 0.1) %<=% 0.3 # FALSE

 # Use >~ and <~ for greater/less than or approx equal
 (0.1 + 0.1 + 0.1) %>~% 0.3 # TRUE
 (0.1 + 0.1 + 0.1) %<~% 0.3 # TRUE





