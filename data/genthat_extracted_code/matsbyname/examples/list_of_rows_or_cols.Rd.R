library(matsbyname)


### Name: list_of_rows_or_cols
### Title: Named list of rows or columns of matrices
### Aliases: list_of_rows_or_cols

### ** Examples

m <- matrix(data = c(1:6), 
            nrow = 2, ncol = 3, 
            dimnames = list(c("p1", "p2"), c("i1", "i2", "i3"))) %>%
  setrowtype(rowtype = "Products") %>% setcoltype(coltype = "Industries")
list_of_rows_or_cols(m, margin = 1)
list_of_rows_or_cols(m, margin = 2)



