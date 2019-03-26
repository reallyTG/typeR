library(matsbyname)


### Name: samestructure_byname
### Title: Test whether matrices or lists of matrices have same structure
### Aliases: samestructure_byname

### ** Examples

samestructure_byname(2, 2)
productnames <- c("p1", "p2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(productnames, industrynames)) %>%
  setrowtype("Products") %>% setcoltype("Industries")
samestructure_byname(U, U)
samestructure_byname(U, U %>% setrowtype("row"))
samestructure_byname(U %>% setcoltype("col"), U)
# Also works with lists
samestructure_byname(list(U, U), list(U, U))



