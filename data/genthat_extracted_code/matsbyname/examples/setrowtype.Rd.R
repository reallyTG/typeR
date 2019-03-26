library(matsbyname)


### Name: setrowtype
### Title: Sets row type for a matrix or a list of matrices
### Aliases: setrowtype

### ** Examples

library(dplyr)
commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames))
U %>% setrowtype("Commodities")
# This also works for lists
setrowtype(list(U,U), rowtype = "Commodities")
setrowtype(list(U,U), rowtype = list("Commodities", "Commodities"))
DF <- data.frame(U = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
setrowtype(DF$U, "Commodities")
DF <- DF %>% mutate(newcol = setrowtype(U, "Commodities"))
DF$newcol[[1]]
DF$newcol[[2]]



