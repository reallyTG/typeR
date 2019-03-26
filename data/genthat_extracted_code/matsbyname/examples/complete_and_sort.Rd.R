library(matsbyname)


### Name: complete_and_sort
### Title: Complete matrices relative to one another and sort into same
###   row, column order
### Aliases: complete_and_sort

### ** Examples

m1 <- matrix(c(1:6), nrow=3, dimnames = list(c("r1", "r2", "r3"), c("c2", "c1")))
m2 <- matrix(c(7:12), ncol=3, dimnames = list(c("r3", "r4"), c("c2", "c3", "c4")))
complete_and_sort(m1)
complete_and_sort(m1, m2)
complete_and_sort(m1, m2, roworder = c("r3", "r2", "r1"))
complete_and_sort(m1, m2, colorder = c("c4", "c3")) # Drops un-specified columns
complete_and_sort(m1, m2, margin = 1)
complete_and_sort(m1, m2, margin = 2)
complete_and_sort(m1, t(m2))
complete_and_sort(m1, t(m2), margin = 1)
complete_and_sort(m1, t(m2), margin = 2)
v <- matrix(1:6, ncol=2, dimnames=list(c("r3", "r1", "r2"), c("c2", "c1")))
complete_and_sort(v, v)
# Also works with lists
complete_and_sort(list(m1,m1), list(m2,m2))



