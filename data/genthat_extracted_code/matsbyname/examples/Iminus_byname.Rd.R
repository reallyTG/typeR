library(matsbyname)


### Name: Iminus_byname
### Title: Subtract a matrix with named rows and columns from a suitably
###   named and sized identity matrix ('I')
### Aliases: Iminus_byname

### ** Examples

m <- matrix(c(-21, -12, -21, -10), ncol = 2, dimnames = list(c("b", "a"), c("b", "a"))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
# Rows and columns are unsorted
diag(1, nrow = 2) - m 
# Rows and columns are sorted prior to subtracting from the identity matrix
Iminus_byname(m) 
# This also works with lists
Iminus_byname(list(m,m))
# If the m is not square before subtracting from I,
# it will be made square by the function complete_and_sort.
m2 <- matrix(c(1,2,3,4,5,6), ncol = 2, dimnames = list(c("a", "b", "c"), c("a", "b"))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
Iminus_byname(m2)



