library(vctrs)


### Name: list_of
### Title: 'list_of' S3 class for homogenous lists
### Aliases: list_of as_list_of is_list_of vec_type2.vctrs_list_of
###   vec_cast.vctrs_list_of

### ** Examples

x <- list_of(1:3, 5:6, 10:15)
if (requireNamespace("tibble", quietly = TRUE)) {
  tibble::tibble(x = x)
}

vec_c(list_of(1, 2), list_of(FALSE, TRUE))



