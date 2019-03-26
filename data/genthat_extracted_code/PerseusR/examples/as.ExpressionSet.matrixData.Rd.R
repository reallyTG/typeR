library(PerseusR)


### Name: as.ExpressionSet.matrixData
### Title: Coerces a MatrixData into an ExpressionSet
### Aliases: as.ExpressionSet.matrixData

### ** Examples


## No test: 
mD <- matrixData(
main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(b=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))))

eSet <- as(mD, "ExpressionSet")
print(eSet)
## End(No test)



