library(matsbyname)


### Name: unaryapply_byname
### Title: Apply a unary function by name
### Aliases: unaryapply_byname

### ** Examples

productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
  setrowtype("Products") %>% setcoltype("Industries")
difference_byname(0, U)
unaryapply_byname(`-`, U)



