library(splitstackshape)


### Name: listCol_w
### Title: Flatten a Column Stored as a List
### Aliases: listCol_w

### ** Examples


dat <- data.frame(A = 1:3, B = I(list(c(1, 2), c(1, 3, 5), c(4))))
listCol_w(dat, "B")




