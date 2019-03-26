library(matsbyname)


### Name: logarithmicmean_byname
### Title: Name- and element-wise logarithmic mean of matrices
### Aliases: logarithmicmean_byname

### ** Examples

library(dplyr)
m1 <- matrix(c(1:6), nrow = 3, ncol = 2) %>% 
  setrownames_byname(c("r1", "r2", "r3")) %>% setcolnames_byname(c("c1", "c2")) %>% 
  setrowtype("row") %>% setcoltype("col")
m2 <- matrix(c(7:12), nrow = 3, ncol = 2) %>% 
  setrownames_byname(c("r2", "r3", "r4")) %>% setcolnames_byname(c("c2", "c3")) %>% 
  setrowtype("row") %>% setcoltype("col")
logarithmicmean_byname(m1, m2)
# This also works with lists
logarithmicmean_byname(list(m1, m1), list(m2, m2))
DF <- data.frame(m1 = I(list()), m2 = I(list()))
DF[[1,"m1"]] <- m1
DF[[2,"m1"]] <- m1
DF[[1,"m2"]] <- m2
DF[[2,"m2"]] <- m2
logarithmicmean_byname(DF$m1, DF$m2)
DF %>% mutate(logmeans = logarithmicmean_byname(m1, m2))



