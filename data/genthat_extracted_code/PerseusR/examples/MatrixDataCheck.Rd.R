library(PerseusR)


### Name: MatrixDataCheck
### Title: MatrixDataCheck: a function to check the validity of an object
###   as a perseus data frame
### Aliases: MatrixDataCheck MatrixDataCheck.default
###   MatrixDataCheck.matrixData MatrixDataCheck.list
###   MatrixDataCheck.ExpressionSet

### ** Examples


require(PerseusR)

mat <- matrixData(
    main=data.frame(a=1:3, b=6:8),
    annotCols=data.frame(c=c('a','b','c')),
    annotRows=data.frame(x=factor(c('1','1'))))

MatrixDataCheck(mat)




