library(matsbyname)


### Name: abs_byname
### Title: Absolute value of matrix elements
### Aliases: abs_byname

### ** Examples

abs_byname(1)
abs_byname(-1)
m <- matrix(c(-10,1,1,100), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Commodity")
abs_byname(m)



