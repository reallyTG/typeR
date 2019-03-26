library(matsbyname)


### Name: mean_byname
### Title: Name- and element-wise arithmetic mean of matrices
### Aliases: mean_byname

### ** Examples

library(dplyr)
mean_byname(100, 50)
mean_byname(10, 20, 30)
commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
G <- matrix(rev(1:4), ncol = 2, dimnames = list(rev(commoditynames), rev(industrynames))) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
(U + G) / 2 # Non-sensical. Row and column names not respected.
mean_byname(U, G) # Row and column names respected! Should be 1, 2, 3, and 4. 
mean_byname(U, G, G)
mean_byname(100, U)
mean_byname(100, 50, U)
mean_byname(10, G)
# This also works with lists
mean_byname(list(100, 100), list(50, 50))
mean_byname(list(U,U), list(G,G))
DF <- data.frame(U = I(list()), G = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
DF[[1,"G"]] <- G
DF[[2,"G"]] <- G
mean_byname(DF$U, DF$G)
DF %>% mutate(means = mean_byname(U, G))



