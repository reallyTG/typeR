library(matsbyname)


### Name: select_rows_byname
### Title: Select rows of a matrix (or list of matrices) by name
### Aliases: select_rows_byname

### ** Examples

m <- matrix(1:16, ncol = 4, dimnames=list(c(paste0("i", 1:4)), paste0("p", 1:4))) %>%
  setrowtype("Industries") %>% setcoltype("Commodities")
select_rows_byname(m, retain_pattern = make_pattern(c("i1", "i4"), pattern_type = "exact"))
select_rows_byname(m, remove_pattern = make_pattern(c("i1", "i3"), pattern_type = "exact"))
# Also works for lists and data frames
select_rows_byname(list(m,m), retain_pattern = "^i1$|^i4$")



