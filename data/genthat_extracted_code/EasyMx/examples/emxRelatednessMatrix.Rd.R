library(EasyMx)


### Name: emxRelatednessMatrix
### Title: Create a relatedness matrix
### Aliases: emxRelatednessMatrix

### ** Examples

   
# Create a Cholesky variance matrix called 'A'
require(EasyMx)
ahmat <- emxRelatednessMatrix(2, c(1, .5, 1), labels=c(NA, 'data.RCoef', NA), name='AH')
# data.RCoef creates a definition variable and ignores the .5 value.




