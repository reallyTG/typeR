library(lava)


### Name: csplit
### Title: Split data into folds
### Aliases: csplit foldr

### ** Examples

foldr(5,2,rep=2)
csplit(10,3)
csplit(iris[1:10,]) ## Split in two sets 1:(n/2) and (n/2+1):n
csplit(iris[1:10,],0.5)



