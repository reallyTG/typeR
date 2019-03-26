library(lpSolveAPI)


### Name: dim.lpExtPtr
### Title: Dimension of an Object
### Aliases: dim.lpExtPtr dim<-.lpExtPtr
### Keywords: programming

### ** Examples

lps.model <- make.lp(4, 0)

x <- c(6,2,4,9)
add.column(lps.model, x)

y <- c(3,1,5)
ind <- c(1,2,4)
add.column(lps.model, y, ind)

dim(lps.model)



