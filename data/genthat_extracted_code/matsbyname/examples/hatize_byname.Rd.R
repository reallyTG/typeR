library(matsbyname)


### Name: hatize_byname
### Title: Creates a diagonal "hat" matrix from a vector
### Aliases: hatize_byname

### ** Examples

v <- matrix(1:10, ncol = 1, dimnames = list(c(paste0("i", 1:10)), c("c1"))) %>%
  setrowtype("Industries") %>% setcoltype(NA)
r <- matrix(1:5, nrow = 1, dimnames = list(c("r1"), c(paste0("c", 1:5)))) %>%
  setrowtype(NA) %>% setcoltype("Commodities")
hatize_byname(v)
hatize_byname(r)
# This also works with lists.
hatize_byname(list(v, v))



