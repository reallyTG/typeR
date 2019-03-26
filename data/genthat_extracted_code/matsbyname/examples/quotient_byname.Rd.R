library(matsbyname)


### Name: quotient_byname
### Title: Name-wise matrix element division
### Aliases: quotient_byname

### ** Examples

library(dplyr)
quotient_byname(100, 50)
commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames)) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
G <- matrix(rev(1:4), ncol = 2, dimnames = list(rev(commoditynames), rev(industrynames))) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
U / G # Non-sensical.  Names aren't aligned
quotient_byname(U, G)
quotient_byname(U, 10)
quotient_byname(10, G)
# This also works with lists
quotient_byname(10, list(G,G))
quotient_byname(list(G,G), 10)
quotient_byname(list(U, U), list(G, G))
DF <- data.frame(U = I(list()), G = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
DF[[1,"G"]] <- G
DF[[2,"G"]] <- G
quotient_byname(DF$U, DF$G)
DF %>% mutate(elementquotients = quotient_byname(U, G))



