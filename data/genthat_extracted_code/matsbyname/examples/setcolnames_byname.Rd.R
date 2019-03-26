library(matsbyname)


### Name: setcolnames_byname
### Title: Sets column names
### Aliases: setcolnames_byname

### ** Examples

m <- matrix(c(1:6), nrow = 2, dimnames = list(paste0("i", 1:2), paste0("c", 1:3))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
setcolnames_byname(m, c("a", "b", "c"))



