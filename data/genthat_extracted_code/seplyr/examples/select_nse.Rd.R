library(seplyr)


### Name: select_nse
### Title: Select columns non-standard (code capturing) interface.
### Aliases: select_nse

### ** Examples


y <- "x"

# returns y-column
dplyr::select(data.frame(x = 1, y = 2), y)

# returns x-column (very confusing!)
dplyr::select(data.frame(x = 1), y)

# returns y-column
select_nse(data.frame(x = 1, y = 2), y)

# deletes wrong column!
dplyr::select(data.frame(x = 1, z = 3), -y)

# throws when y is not the name of a column (good)
tryCatch(
  select_nse(data.frame(x = 1), y),
  error = function(e) { e }
)

#' # throws when y is not the name of a column (good)
tryCatch(
  select_nse(data.frame(x = 1, z = 3), -y),
  error = function(e) { e }
)




