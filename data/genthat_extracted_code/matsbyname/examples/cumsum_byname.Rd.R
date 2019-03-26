library(matsbyname)


### Name: cumsum_byname
### Title: Cumulative sum that respects row and column names
### Aliases: cumsum_byname

### ** Examples

library(dplyr)
m1 <- matrix(c(1), nrow = 1, ncol = 1, dimnames = list("r1", "c1")) %>% 
  setrowtype("row") %>% setcoltype("col")
m2 <- matrix(c(2), nrow = 1, ncol = 1, dimnames = list("r2", "c2")) %>% 
  setrowtype("row") %>% setcoltype("col")
m3 <- matrix(c(3), nrow = 1, ncol = 1, dimnames = list("r3", "c3")) %>% 
  setrowtype("row") %>% setcoltype("col")
cumsum_byname(list(m1, m2, m3))
# Groups are respected in the context of mutate.
data.frame(grp = c("A", "A", "B"), m = I(list(m1, m2, m3))) %>% group_by(grp) %>% 
  mutate(m2 = cumsum_byname(m))



