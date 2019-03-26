library(INDperform)


### Name: get_signif_code
### Title: Create a code indicating the significance of values given by
###   p_val.
### Aliases: get_signif_code
### Keywords: internal

### ** Examples

x <- tibble::tibble(p_val = list("test", NA, runif(1, 0, .1), runif(1, 0, .01)))
x$code <- get_signif_code(x$p_val)



