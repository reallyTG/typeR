library(PerseusR)


### Name: read.perseus.default
### Title: Read Perseus matrix files
### Aliases: read.perseus.default read.perseus.as.list
###   read.perseus.as.matrixData read.perseus.as.ExpressionSet read.perseus

### ** Examples

tmp <- tempfile(fileext = ".txt")
write('Column_1\tColumn_2\tColumn_3
#!{Description}\t\t
#!{Type}E\tE\tE
-1.860574\t-0.3910594\t0.2870352
NaN\t-0.4742951\t0.849998', file=tmp)
mdata <- read.perseus(tmp)




