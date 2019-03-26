library(hablar)


### Name: could_this_be_that
### Title: Tests is a vector could be of another data type
### Aliases: could_this_be_that could_chr_be_num could_chr_be_int
###   could_num_be_int could_chr_be_dtm could_dtm_be_dte

### ** Examples

x <- c("1", "3", "7")
could_chr_be_num(x)
could_chr_be_int(x)

x <- c("abc", "3", "Hello world")
could_chr_be_num(x)

x <- c(NA, "3.45", "5,98")
could_chr_be_num(x)
could_chr_be_int(x)

x <- as.numeric(c(3.45, 1.5))
could_num_be_int(x)

x <- as.numeric(c(7, 2))
could_num_be_int(x)




