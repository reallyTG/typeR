library(arulesSequences)


### Name: sgCMatrix-class
### Title: Class "sgCMatrix" - Sparse Ordered Lists of Symbols
### Aliases: sgCMatrix-class coerce,sgCMatrix,list-method
###   coerce,list,sgCMatrix-method coerce,ngCMatrix,sgCMatrix-method
###   [,sgCMatrix,ANY,ANY,ANY-method dim,sgCMatrix-method
###   dimnames,sgCMatrix-method dimnames<-,sgCMatrix,ANY-method
###   show,sgCMatrix-method
### Keywords: classes

### ** Examples

## 3 example sequences
x <- list("01" = list(c("A","B"), "C"), 
          "02" = list("C"), 
	  "03" = list("B", "B"))

## uses paste
s <- as(x, "sgCMatrix")
s

##
dim(s)
dimnames(s)



