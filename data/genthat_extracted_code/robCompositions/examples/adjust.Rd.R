library(robCompositions)


### Name: adjust
### Title: Adjusting for original scale
### Aliases: adjust
### Keywords: manip

### ** Examples


data(expenditures)
x <- expenditures
x[1,3] <- x[2,4] <- x[3,3] <- x[3,4] <- NA
xi <- impCoda(x)
x
xi$xImp
adjust(xi)$xImp




