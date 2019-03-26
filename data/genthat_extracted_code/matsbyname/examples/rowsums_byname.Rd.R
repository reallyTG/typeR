library(matsbyname)


### Name: rowsums_byname
### Title: Row sums, sorted by name
### Aliases: rowsums_byname

### ** Examples

library(dplyr)
m <- matrix(c(1:6), ncol = 2, dimnames = list(paste0("i", 3:1), paste0("c", 1:2))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
rowsums_byname(m)
rowsums_byname(m, "E.ktoe")
# This also works with lists
rowsums_byname(list(m, m))
rowsums_byname(list(m, m), "E.ktoe")
rowsums_byname(list(m, m), NA)
rowsums_byname(list(m, m), NULL)
DF <- data.frame(m = I(list()))
DF[[1,"m"]] <- m
DF[[2,"m"]] <- m
rowsums_byname(DF$m[[1]])
rowsums_byname(DF$m)
ans <- DF %>% mutate(rs = rowsums_byname(m))
ans
ans$rs[[1]]
# Nonsensical
## Not run: rowsums_byname(NULL)



