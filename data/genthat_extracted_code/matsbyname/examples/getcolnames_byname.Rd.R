library(matsbyname)


### Name: getcolnames_byname
### Title: Gets column names
### Aliases: getcolnames_byname

### ** Examples

m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:3))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
getcolnames_byname(m)
# This also works for lists
getcolnames_byname(list(m,m))
DF <- data.frame(m = I(list()))
DF[[1,"m"]] <- m
DF[[2,"m"]] <- m
getcolnames_byname(DF$m)



