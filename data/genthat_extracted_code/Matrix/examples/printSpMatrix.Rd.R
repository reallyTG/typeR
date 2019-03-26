library(Matrix)


### Name: printSpMatrix
### Title: Format and Print Sparse Matrices Flexibly
### Aliases: formatSpMatrix printSpMatrix printSpMatrix2
### Keywords: print

### ** Examples

f1 <- gl(5, 3, labels = LETTERS[1:5])
X <- as(f1, "sparseMatrix")
X ## <==>  show(X)  <==>  print(X)
t(X) ## shows column names, since only 5 columns

X2 <- as(gl(12, 3, labels = paste(LETTERS[1:12],"c",sep=".")),
         "sparseMatrix")
X2
## less nice, but possible:
print(X2, col.names = TRUE) # use [,1] [,2] .. => does not fit

## Possibilities with column names printing:
      t(X2) # suppressing column names
print(t(X2), col.names=TRUE)
print(t(X2), zero.print = "", col.names="abbr. 1")
print(t(X2), zero.print = "-", col.names="substring 2")

## Don't show: 
op <- options(max.print = 25000, width = 80)
sink(print(tempfile()))
M <- Matrix(0, 10000, 100)
M[1,1] <- M[2,3] <- 3.14
stopifnot((st <- system.time(show(M)))[1] < 1.0) # only 0.09 on cmath-3
sink()
st
options(op)
## End(Don't show)



