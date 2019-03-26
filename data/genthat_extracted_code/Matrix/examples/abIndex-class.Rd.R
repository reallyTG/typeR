library(Matrix)


### Name: abIndex-class
### Title: Class "abIndex" of Abstract Index Vectors
### Aliases: abIndex-class seqMat-class coerce,abIndex,seqMat-method
###   coerce,numeric,seqMat-method coerce,seqMat,abIndex-method
###   coerce,seqMat,numeric-method as.integer,abIndex-method
###   as.numeric,abIndex-method as.vector,abIndex-method
###   [,abIndex,index,ANY,ANY-method coerce,logical,abIndex-method
###   coerce,numeric,abIndex-method coerce,abIndex,integer-method
###   coerce,abIndex,numeric-method coerce,abIndex,vector-method
###   drop,abIndex-method length,abIndex-method show,abIndex-method
###   is.na,abIndex-method is.finite,abIndex-method
###   is.infinite,abIndex-method Ops,numeric,abIndex-method
###   Ops,abIndex,abIndex-method Ops,abIndex,numeric-method
###   Ops,abIndex,ANY-method Ops,ANY,abIndex-method
###   Arith,abIndex,abIndex-method Arith,abIndex,numLike-method
###   Arith,numLike,abIndex-method Summary,abIndex-method
### Keywords: classes

### ** Examples

showClass("abIndex")
ii <- c(-3:40, 20:70)
str(ai <- as(ii, "abIndex"))# note
ai # -> show() method

stopifnot(identical(-3:20,
                    as(abIseq1(-3,20), "vector")))



