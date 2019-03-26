library(rlang)


### Name: are_na
### Title: Test for missing values
### Aliases: are_na is_na is_lgl_na is_int_na is_dbl_na is_chr_na is_cpl_na

### ** Examples

# are_na() is vectorised and works regardless of the type
are_na(c(1, 2, NA))
are_na(c(1L, NA, 3L))

# is_na() checks for scalar input and works for all types
is_na(NA)
is_na(na_dbl)
is_na(character(0))

# There are typed versions as well:
is_lgl_na(NA)
is_lgl_na(na_dbl)



