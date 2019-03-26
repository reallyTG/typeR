library(matsbyname)


### Name: cumprod_byname
### Title: Cumulative element-product that respects row and column names
### Aliases: cumprod_byname

### ** Examples

cumprod_byname(list(1, 2, 3, 4, 5))
m1 <- matrix(c(1), nrow = 1, ncol = 1, dimnames = list("r1", "c1")) %>%
  setrowtype("row") %>% setcoltype("col")
m2 <- matrix(c(2), nrow = 1, ncol = 1, dimnames = list("r2", "c2")) %>%
  setrowtype("row") %>% setcoltype("col")
m3 <- matrix(c(3), nrow = 1, ncol = 1, dimnames = list("r3", "c3")) %>%
  setrowtype("row") %>% setcoltype("col")
cumprod_byname(list(m1, m2, m3))



