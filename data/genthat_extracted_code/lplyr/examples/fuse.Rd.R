library(lplyr)


### Name: fuse
### Title: Fuse multiple columns into one
### Aliases: fuse fuse_ fuse_.data.frame fuse_.tbl_df

### ** Examples

df <- data.frame(x = c(NA, "a", NA), 
                 y = c("b", NA, NA))
fuse(df, "z", x, y)

# To be compared with: 
tidyr::unite(df, "z", x, y, sep = "")
# The same
fuse(df, "z", x, y, fun = function(x) concat0(x, na.rm = FALSE))




