library(matsbyname)


### Name: colprods_byname
### Title: Column products, sorted by name
### Aliases: colprods_byname

### ** Examples

library(dplyr)
M <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 3:1))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
colprods_byname(M)
colprods_byname(M, rowname = "E.ktoe")
M %>% colprods_byname %>% rowprods_byname
# This also works with lists
colprods_byname(list(M, M))
colprods_byname(list(M, M), rowname = "E.ktoe")
colprods_byname(list(M, M), rowname = NA)
colprods_byname(list(M, M), rowname = NULL)
DF <- data.frame(M = I(list()))
DF[[1,"M"]] <- M
DF[[2,"M"]] <- M
colprods_byname(DF$M[[1]])
colprods_byname(DF$M)
colprods_byname(DF$M, "prods")
res <- DF %>% mutate(
  cs = colprods_byname(M),
  cs2 = colprods_byname(M, rowname = "prod")
)
res$cs2



