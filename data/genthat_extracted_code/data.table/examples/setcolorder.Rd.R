library(data.table)


### Name: setcolorder
### Title: Fast column reordering of a data.table by reference
### Aliases: setcolorder
### Keywords: data

### ** Examples


set.seed(45L)
DT = data.table(A=sample(3, 10, TRUE),
         B=sample(letters[1:3], 10, TRUE), C=sample(10))

setcolorder(DT, c("C", "A", "B"))

#incomplete specification
setcolorder(DT, "A")



