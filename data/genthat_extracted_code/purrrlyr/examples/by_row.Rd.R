library(purrrlyr)


### Name: by_row
### Title: Apply a function to each row of a data frame
### Aliases: by_row invoke_rows map_rows

### ** Examples

# ..f should be able to work with a list or a data frame. As it
# happens, sum() handles data frame so the following works:
mtcars %>% by_row(sum)

# Other functions such as mean() may need to be adjusted with one
# of the lift_xy() helpers:
mtcars %>% by_row(purrr::lift_vl(mean))

# To run a function with invoke_rows(), make sure it is variadic (that
# it accepts dots) or that .f's signature is compatible with the
# column names
mtcars %>% invoke_rows(.f = sum)
mtcars %>% invoke_rows(.f = purrr::lift_vd(mean))

# invoke_rows() with cols collation is equivalent to plyr::mdply()
p <- expand.grid(mean = 1:5, sd = seq(0, 1, length = 10))
p %>% invoke_rows(.f = rnorm, n = 5, .collate = "cols")
## Not run: 
##D p %>% plyr::mdply(rnorm, n = 5) %>% dplyr::tbl_df()
## End(Not run)

# To integrate the result as part of the data frame, use rows or
# cols collation:
mtcars[1:2] %>% by_row(function(x) 1:5)
mtcars[1:2] %>% by_row(function(x) 1:5, .collate = "rows")
mtcars[1:2] %>% by_row(function(x) 1:5, .collate = "cols")



