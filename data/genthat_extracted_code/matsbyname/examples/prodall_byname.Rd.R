library(matsbyname)


### Name: prodall_byname
### Title: Product of all elements in a matrix
### Aliases: prodall_byname

### ** Examples

library(dplyr)
M <- matrix(2, nrow=2, ncol=2, dimnames = list(paste0("i", 1:2), paste0("c", 1:2))) %>%
  setrowtype("Industry") %>% setcoltype("Product")
prodall_byname(M)
rowprods_byname(M) %>% colprods_byname
# Also works for lists
prodall_byname(list(M,M))
DF <- data.frame(M = I(list()))
DF[[1,"M"]] <- M
DF[[2,"M"]] <- M
prodall_byname(DF$M[[1]])
prodall_byname(DF$M)
res <- DF %>% mutate(
  prods = prodall_byname(M)
)
res$prods



