library(matsbyname)


### Name: matrixproduct_byname
### Title: Name-wise matrix multiplication
### Aliases: matrixproduct_byname

### ** Examples

library(dplyr)
V <- matrix(1:6, ncol = 3, dimnames = list(c("i1", "i2"), c("c1", "c2", "c3"))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
G <- matrix(1:4, ncol = 2, dimnames = list(c("c2", "c1"), c("i2", "i1"))) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
Z <- matrix(11:14, ncol = 2, dimnames = list(c("i1", "i2"), c("s1", "s2"))) %>% 
  setrowtype("Industries") %>% setcoltype("Sectors")
# Succeeds because G is completed to include a row named c3 (that contains zeroes).
matrixproduct_byname(V, G)
## Not run: V %*% G # Fails because E lacks a row named c3.
matrixproduct_byname(V, G, Z)
# This also works with lists
matrixproduct_byname(list(V,V), list(G,G))
DF <- data.frame(V = I(list()), G = I(list()))
DF[[1,"V"]] <- V
DF[[2,"V"]] <- V
DF[[1,"G"]] <- G
DF[[2,"G"]] <- G
matrixproduct_byname(DF$V, DF$G)
DF %>% mutate(matprods = matrixproduct_byname(V, G))



