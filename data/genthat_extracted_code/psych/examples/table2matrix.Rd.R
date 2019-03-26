library(psych)


### Name: table2matrix
### Title: Convert a table with counts to a matrix or data.frame
###   representing those counts.
### Aliases: table2matrix table2df
### Keywords: models

### ** Examples

data(cubits)
cubit <- table2matrix(cubits,labs=c("height","cubit"))
describe(cubit)
ellipses(cubit,n=1)
data(bock)
responses <- table2df(bock.table[,2:6],count=bock.table[,7],labs= paste("lsat6.",1:5,sep=""))
describe(responses)



