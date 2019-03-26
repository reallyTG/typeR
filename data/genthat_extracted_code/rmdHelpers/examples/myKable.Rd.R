library(rmdHelpers)


### Name: myKable
### Title: Wrapper for kable
### Aliases: myKable
### Keywords: kable

### ** Examples

tempTable <- matrix(LETTERS[6:20], nrow = 5)
colnames(tempTable) <- LETTERS[24:26]
row.names(tempTable) <- LETTERS[1:5]
myKable(tempTable)

myKable(tempTable, boldColNames =  FALSE)



