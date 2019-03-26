library(DescTools)


### Name: Rev
### Title: Reverse Elements of a Vector or the Rows/Columns of Matrices,
###   Tables or Data.frames
### Aliases: Rev Rev.default Rev.matrix Rev.table Rev.data.frame
### Keywords: manip

### ** Examples

tab <- matrix( c( 1, 11, 111,
                  2, 22, 222,
                  3, 33, 333), byrow=TRUE, nrow=3)

Rev(tab, margin=1)
Rev(tab, margin=2)

# reverse both dimensions
Rev(tab, margin=c(1,2))



