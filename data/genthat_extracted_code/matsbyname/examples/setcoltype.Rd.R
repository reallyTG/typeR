library(matsbyname)


### Name: setcoltype
### Title: Sets column type for a matrix or a list of matrices
### Aliases: setcoltype

### ** Examples

library(dplyr)
commoditynames <- c("c1", "c2")
industrynames <- c("i1", "i2")
U <- matrix(1:4, ncol = 2, dimnames = list(commoditynames, industrynames))
U %>% setcoltype("Industries")
# This also works for lists
setcoltype(list(U,U), coltype = "Industries")
setcoltype(list(U,U), coltype = list("Industries", "Industries"))
DF <- data.frame(U = I(list()))
DF[[1,"U"]] <- U
DF[[2,"U"]] <- U
setcoltype(DF$U, "Industries")
DF <- DF %>% mutate(newcol = setcoltype(U, "Industries"))
DF$newcol[[1]]
DF$newcol[[2]]



