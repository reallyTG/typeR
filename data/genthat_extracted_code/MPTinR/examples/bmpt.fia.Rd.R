library(MPTinR)


### Name: bmpt.fia
### Title: Compute FIA for MPTs
### Aliases: bmpt.fia

### ** Examples

## Not run: 
##D # The following example is the code for the first example in Wu, Myung & Batchelder (2010a, pp. 280)
##D # The result should be something like: CFIA = 12.61... or 12.62..., CI = 12.61... - 12.62....
##D # Executing this command can take a while.
##D 
##D bmpt.fia(s = "ppppCpCCppCCCppCpCCppCCCppCCC", 
##D 	parameters = c(-0.5, -0.5, 3, 2, 5, 1, 5, 4, 2, 5, 1, 5, 1, 5), 
##D 	category = c(1,1,2,1,2,3,5,4,5,4,5,6,7,8,9), 
##D   N = 1000, ineq0 = matrix(c(4,3),1,2))
##D 
##D bmpt.fia(s = "ppppCpCCppCCCppCpCCppCCCppCCC", 
##D 	parameters = c(-0.5, -0.5, 3, 2, 5, 1, 5, 4, 2, 5, 1, 5, 1, 5), 
##D 	category = c(1,1,2,1,2,3,5,4,5,4,5,6,7,8,9), 
##D   N = 1000, ineq0 = matrix(c(4,3),1,2), mConst = 2L^8)
## End(Not run)
  


