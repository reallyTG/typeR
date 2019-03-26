library(HH)


### Name: as.matrix.listOfNamedMatrices
### Title: Convert a list of matrices to a single matrix
### Aliases: as.matrix.listOfNamedMatrices is.listOfNamedMatrices
###   as.data.frame.listOfNamedMatrices as.listOfNamedMatrices
###   print.listOfNamedMatrices as.MatrixList as.MatrixList.array
###   print.MatrixList matrix [.listOfNamedMatrices
###   as.listOfNamedMatrices.array as.listOfNamedMatrices.list
###   as.listOfNamedMatrices.MatrixList as.likertDataFrame
###   as.likertDataFrame.listOfNamedMatrices as.likertDataFrame.array
### Keywords: print

### ** Examples

data(ProfChal)

tmp <- data.matrix(ProfChal[,1:5])
rownames(tmp) <- ProfChal$Question
ProfChal.list <- split.data.frame(tmp, ProfChal$Subtable)

## Original list of matrices is difficult to read because
## it is displayed on too many lines.
ProfChal.list[2:3]

## Single matrix with long list item names and long row names
## of argument list retained as an attribute.
as.listOfNamedMatrices(ProfChal.list[2:3], minlength=6)

tmp3 <- array(1:24, dim=c(2,3,4), dimnames=list(A=letters[1:2], B=LETTERS[3:5], C=letters[6:9]))
tmp3
as.MatrixList(tmp3)

## Not run: 
##D sapply(as.MatrixList(tmp3), as.likert, simplify=FALSE)  ## odd number of levels.
##D 
##D data(NZScienceTeaching)
##D likert(Question ~ ., NZScienceTeaching)
##D likert(Question ~ . | Subtable, data=NZScienceTeaching)
##D likert(Question ~ . | Subtable, data=NZScienceTeaching,
##D        layout=c(1,2), scales=list(y=list(relation="free")))
## End(Not run)



