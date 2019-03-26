library(matsbyname)


### Name: elementapply_byname
### Title: Apply a function to an element of a matrix specified by rows and
###   columns
### Aliases: elementapply_byname

### ** Examples

divide <- function(x, divisor){
  x/divisor
}
m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
  setrowtype("row") %>% setcoltype("col")
elementapply_byname(divide, a = m, row = 1, col = 1, .FUNdots = list(divisor = 2))
elementapply_byname(divide, a = m, row = 1, col = 2, .FUNdots = list(divisor = 10))
elementapply_byname(divide, a = m, row = "r2", col = "c2", .FUNdots = list(divisor = 100))



