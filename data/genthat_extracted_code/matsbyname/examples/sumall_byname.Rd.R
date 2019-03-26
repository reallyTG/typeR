library(matsbyname)


### Name: sumall_byname
### Title: Sum of all elements in a matrix
### Aliases: sumall_byname

### ** Examples

library(dplyr)
m <- matrix(2, nrow=2, ncol=2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Commodity")
sumall_byname(m)
rowsums_byname(m) %>% colsums_byname
# Also works for lists
sumall_byname(list(m,m))
DF <- data.frame(m = I(list()))
DF[[1,"m"]] <- m
DF[[2,"m"]] <- m
sumall_byname(DF$m[[1]])
sumall_byname(DF$m)
res <- DF %>% mutate(
  sums = sumall_byname(m)
)
res$sums



