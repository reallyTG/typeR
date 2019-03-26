library(matsbyname)


### Name: invert_byname
### Title: Invert a matrix
### Aliases: invert_byname

### ** Examples

m <- matrix(c(10,0,0,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Commodity")
invert_byname(m)
matrixproduct_byname(m, invert_byname(m))
matrixproduct_byname(invert_byname(m), m)
invert_byname(list(m,m))



