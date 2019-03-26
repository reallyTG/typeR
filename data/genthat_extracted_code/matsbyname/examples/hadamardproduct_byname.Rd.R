library(matsbyname)


### Name: hadamardproduct_byname
### Title: Name-wise matrix Hadamard multiplication
### Aliases: hadamardproduct_byname

### ** Examples

library(dplyr)
hadamardproduct_byname(2, 2)
commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
G <- matrix(1:4, ncol = 2, dimnames = list(rev(commoditynames), rev(industrynames))) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
U * G # Not what is desired, because names aren't aligned
hadamardproduct_byname(U, G)
hadamardproduct_byname(U, G, G)
hadamardproduct_byname(U, 0)
hadamardproduct_byname(0, G)
# This also works with lists
hadamardproduct_byname(list(U, U), list(G, G))
DF <- data.frame(U = I(list()), G = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
DF[[1,"G"]] <- G
DF[[2,"G"]] <- G
hadamardproduct_byname(DF$U, DF$G)
DF %>% mutate(entrywiseprods = hadamardproduct_byname(U, G))



