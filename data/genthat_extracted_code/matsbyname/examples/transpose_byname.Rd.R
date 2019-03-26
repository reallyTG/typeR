library(matsbyname)


### Name: transpose_byname
### Title: Transpose a matrix by name
### Aliases: transpose_byname

### ** Examples

m <- matrix(c(11,21,31,12,22,32), ncol = 2, dimnames = list(paste0("i", 1:3), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Commodity")
transpose_byname(m)
transpose_byname(list(m,m))



