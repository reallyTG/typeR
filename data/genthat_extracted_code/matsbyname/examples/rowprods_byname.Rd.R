library(matsbyname)


### Name: rowprods_byname
### Title: Row products, sorted by name
### Aliases: rowprods_byname

### ** Examples

library(dplyr)
M <- matrix(c(1:6), ncol = 2, dimnames = list(paste0("i", 3:1), paste0("c", 1:2))) %>%
  setrowtype("Industries") %>% setcoltype("Products")
rowprods_byname(M)
rowprods_byname(M, "E.ktoe")
# This also works with lists
rowprods_byname(list(M, M))
rowprods_byname(list(M, M), "E.ktoe")
rowprods_byname(list(M, M), NA)
rowprods_byname(list(M, M), NULL)
DF <- data.frame(M = I(list()))
DF[[1,"M"]] <- M
DF[[2,"M"]] <- M
rowprods_byname(DF$M[[1]])
rowprods_byname(DF$M)
ans <- DF %>% mutate(rs = rowprods_byname(M))
ans
ans$rs[[1]]
# Nonsensical
## Not run: rowprods_byname(NULL)



