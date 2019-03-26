library(TaxicabCA)


### Name: RemoveRowsColumns0sAndDuplicates
### Title: Removes rows and columns of zeros and optionnally, row or column
###   duplicates
### Aliases: RemoveRowsColumns0sAndDuplicates

### ** Examples

RemoveRowsColumns0sAndDuplicates(matrix(1:3,nrow=3,ncol=2),cols=TRUE)

RemoveRowsColumns0sAndDuplicates(cbind(matrix(1:3,nrow=3,ncol=2),rep(0,3)),cols=TRUE)

RemoveRowsColumns0sAndDuplicates(cbind(matrix(1:3,nrow=3,ncol=2),rep(0,3)),zeros=TRUE)

RemoveRowsColumns0sAndDuplicates(matrix(0,nrow=3,ncol=3),zeros=TRUE)




