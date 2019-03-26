library(data.table)


### Name: setorder
### Title: Fast row reordering of a data.table by reference
### Aliases: setorder setorderv order fastorder forder
### Keywords: data

### ** Examples


set.seed(45L)
DT = data.table(A=sample(3, 10, TRUE),
         B=sample(letters[1:3], 10, TRUE), C=sample(10))

# setorder
setorder(DT, A, -B)

# same as above, but using setorderv
setorderv(DT, c("A", "B"), c(1, -1))



