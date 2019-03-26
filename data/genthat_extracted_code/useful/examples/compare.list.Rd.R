library(useful)


### Name: compare.list
### Title: List Comparison
### Aliases: compare.list
### Keywords: list

### ** Examples


vect <- c(mean, mode, mean)
vect2 <- c(mean, mode, max)
vect3 <- c(mean, mean)
compare.list(vect, vect)
compare.list(vect, vect2)
tryCatch(compare.list(vect, vect3), error=function(e) print("Caught error"))




