library(rJava)


### Name: jarray
### Title: Java array handling functions
### Aliases: .jarray .jevalArray
### Keywords: interface

### ** Examples

## Don't show: 
.jinit()
## End(Don't show)
a <- .jarray(1:10)
print(a)
.jevalArray(a)
b <- .jarray(c("hello","world"))
print(b)
c <- .jarray(list(a,b))
print(c)
# simple .jevalArray will return a list of references
print(l <- .jevalArray(c))
# to convert it back, use lapply
lapply(l, .jevalArray)

# two-dimensional array resulting in int[2][10]
d <- .jarray(list(a,a),"[I")
print(d)
# use dispatch to convert a matrix to [[D
e <- .jarray(matrix(1:12/2, 3), dispatch=TRUE)
print(e)
# simplify it back to a matrix
.jevalArray(e, simplify=TRUE)



