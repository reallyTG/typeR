
## Construct data objects for use in testing by test-extract.R

# Canonical matrix to be provided as arg to data_obs
obs <- matrix(1:50,
              nrow=10L,
              dimnames=list(1:10, paste0("var", 1:5)))
obs_df <- data.frame(obs)

# Columns 2 and 4 arbitrarily picked to be the data of interest
var_idx <- c(2L, 4L)
var_nm <- paste0("r", c(2, 4))

# Columns not of interest
var_idx_remain <- setdiff(1:ncol(obs), var_idx)
var_nm_remain <- setdiff(colnames(obs), c("var2", "var4"))

# Character args
var_nm_zero_len <- character(0L)
var_nm_nomatch <- c("var2", "varxyz")
var_nm_dups <- c("var2", "var2")

# Numeric args
var_idx_too_small <- replace(var_idx, 1L, -1L)
var_idx_too_big <- replace(var_idx, 1L, 100L)
var_idx_zero_len <- integer(0L)
var_idx_dups <- c(2L, 2L)
var_idx_NA <- replace(var_idx, 1L, NA_integer_)

# Data with NA or non-numeric
obs_NA_out <- obs
obs_NA_out[2L, var_idx_remain[1L]] <- NA
obs_char_in <- data.frame(obs)
obs_char_in$var2 <- rep("b", 10)

# Data with differing number of rows or columns
obs_zero_row <- obs[integer(0), ]
obs_zero_row_df <- data.frame(obs_zero_row)
obs_zero_col <- obs[, integer(0)]
obs_one_col <- obs[, 1L, drop=FALSE]
obs_short <- obs[1:3, ]

# A single variable from the data
var2 <- obs[, 2L]


save(obs,
     obs_df,
     var_idx,
     var_idx_remain,
     var_nm,
     var_nm_remain,
     var_nm_zero_len,
     var_nm_nomatch,
     var_nm_dups,
     var_idx_too_small,
     var_idx_too_big,
     var_idx_zero_len,
     var_idx_dups,
     var_idx_NA,
     obs_NA_out,
     obs_char_in,
     obs_zero_row,
     obs_zero_row_df,
     obs_zero_col,
     obs_one_col,
     obs_short,
     var2,
     file="tests/data/data-extract.RData")
