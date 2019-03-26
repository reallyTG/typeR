library(flextable)


### Name: borders
### Title: borders management
### Aliases: borders border_remove border_outer border_inner_h
###   border_inner_v hline hline_top hline_bottom vline vline_left
###   vline_right

### ** Examples

# need officer to define border properties
library(officer)
big_border = fp_border(color="red", width = 2)
std_border = fp_border(color="orange", width = 1)

# dataset to be used for examples
dat <- iris[c(1:5, 51:55, 101:105),]


# use of regulartable() to create a table
ft <- regulartable(dat)

# remove all borders
ft <- border_remove(x = ft)

# add outer borders
ft <- border_outer(ft, part="all", border = big_border )
ft

# add inner horizontal borders
ft <- border_inner_h(ft, border = std_border )
ft

# add inner vertical borders
ft <- border_inner_v(ft, border = std_border )
ft

# new example
ft <- regulartable(dat, col_keys = c("Species", "Sepal.Length",
  "Sepal.Width", "Petal.Length", "Petal.Width" ))
ft <- border_remove(x = ft)

# add horizontal borders
ft <- hline(ft, part="all", border = std_border )
ft

# add horizontal border on top
ft <- hline_top(ft, part="all", border = big_border )
ft

# add/replace horizontal border on bottom
ft <- hline_bottom(ft, part="body", border = big_border )
ft

# add vertical borders
ft <- vline(ft, border = std_border )
ft

# add vertical border on the left side of the table
ft <- vline_left(ft, border = big_border )
ft

# add vertical border on the right side of the table
ft <- vline_right(ft, border = big_border )
ft



