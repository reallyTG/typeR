library(TaxicabCA)


### Name: CombineCollinearRowsCols
### Title: Removes rows and columns of zeros and optionnally, row or column
###   duplicates
### Aliases: CombineCollinearRowsCols

### ** Examples

CombineCollinearRowsCols(matrix(1:3,nrow=3,ncol=2),cols=TRUE)

CombineCollinearRowsCols(cbind(matrix(1:3,nrow=3,ncol=2),rep(0,3)),cols=TRUE)

CombineCollinearRowsCols(cbind(matrix(1:3,nrow=3,ncol=2),rep(0,3)))

CombineCollinearRowsCols(matrix(0,nrow=3,ncol=3))

CombineCollinearRowsCols(rodent,TRUE,FALSE)




