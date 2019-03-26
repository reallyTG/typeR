library(matsbyname)


### Name: setrownames_byname
### Title: Sets row names
### Aliases: setrownames_byname

### ** Examples

library(dplyr)
m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:3))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
setrownames_byname(m, c("a", "b"))
setrownames_byname(m %>% setrowtype("Industries") %>% setcoltype("Commodities"), c("c", "d"))
m %>% setrownames_byname(NULL)
m %>% setrownames_byname(c(NA, NA))
2 %>% setrownames_byname("row")
# This also works for lists
setrownames_byname(list(m,m), c("a", "b"))
DF <- data.frame(m = I(list()))
DF[[1,"m"]] <- m
DF[[2,"m"]] <- m
setrownames_byname(DF$m, c("r1", "r2"))
setrownames_byname(DF$m, c("c", "d"))
DF <- DF %>% mutate(m = setrownames_byname(m, c("r1", "r2")))
DF$m[[1]]



