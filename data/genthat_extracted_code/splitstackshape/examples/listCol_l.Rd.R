library(splitstackshape)


### Name: listCol_l
### Title: Unlist a Column Stored as a List
### Aliases: listCol_l

### ** Examples


dat <- data.frame(A = 1:3, B = I(list(c(1, 2), c(1, 3, 5), c(4))))
listCol_l(dat, "B")




