library(matsbyname)


### Name: geometricmean_byname
### Title: Name- and element-wise geometric mean of two matrices.
### Aliases: geometricmean_byname

### ** Examples

library(dplyr)
geometricmean_byname(10, 1000)
geometricmean_byname(10, 1000, 100000)
commoditynames <- c("c1", "c2")
industrynames <- "i1"
U <- matrix(c(10, 1000), ncol = 1, nrow = 2, dimnames = list(commoditynames, industrynames)) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
G <- matrix(c(1e3, 1e5), ncol = 1, nrow = 2, 
            dimnames = list(rev(commoditynames), rev(industrynames))) %>%
  setrowtype("Commodities") %>% setcoltype("Industries")
# Non-sensical. Row and column names not respected.
sqrt(U*G)
# Row and column names respected!
geometricmean_byname(U, G)
geometricmean_byname(1000, U)
geometricmean_byname(10, G)
# This also works with lists
geometricmean_byname(list(10, 1000), list(1000, 10))
geometricmean_byname(list(U,U), list(G,G))
DF <- data.frame(U = I(list()), G = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
DF[[1,"G"]] <- G
DF[[2,"G"]] <- G
geometricmean_byname(DF$U, DF$G)
DF %>% mutate(geomeans = geometricmean_byname(U, G))



