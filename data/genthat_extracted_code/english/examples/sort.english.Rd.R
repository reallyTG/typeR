library(english)


### Name: sort.english
### Title: A sorting method for objects of class english
### Aliases: sort.english
### Keywords: arith

### ** Examples

set.seed(1010)
x <- english(sample(1:100, 5))
noquote(matrix(as.character(x)))
noquote(matrix(as.character(sort(x))))



