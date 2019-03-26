library(matsbyname)


### Name: colsums_byname
### Title: Column sums, sorted by name
### Aliases: colsums_byname

### ** Examples

library(dplyr)
m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 3:1))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
colsums_byname(m)
colsums_byname(m, rowname = "E.ktoe")
m %>% colsums_byname %>% rowsums_byname
# This also works with lists
colsums_byname(list(m, m))
colsums_byname(list(m, m), rowname = "E.ktoe")
colsums_byname(list(m, m), rowname = NA)
colsums_byname(list(m, m), rowname = NULL)
DF <- data.frame(m = I(list()))
DF[[1,"m"]] <- m
DF[[2,"m"]] <- m
colsums_byname(DF$m[[1]])
colsums_byname(DF$m)
colsums_byname(DF$m, "sums")
res <- DF %>% mutate(
  cs = colsums_byname(m),
  cs2 = colsums_byname(m, rowname = "sum")
)
res$cs2



