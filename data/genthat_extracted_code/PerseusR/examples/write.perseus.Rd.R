library(PerseusR)


### Name: write.perseus
### Title: write.perseus: function to generate a perseus-readable text
###   document
### Aliases: write.perseus write.perseus.default write.perseus.matrixData
###   write.perseus.list write.perseus.data.frame write.perseus.matrix
###   write.perseus.ExpressionSet

### ** Examples

df <- matrixData(
main=data.frame(a=1:3, b=6:8),
annotCols=data.frame(b=c('a','b','c')),
annotRows=data.frame(x=factor(c('1','1'))),
description=c('a','a','b'))
con <- textConnection('df1', 'w')
write.perseus(df, con)
close(con)



