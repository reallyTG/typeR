library(purrr)


### Name: imap
### Title: Apply a function to each element of a vector, and its index
### Aliases: imap imap_lgl imap_chr imap_int imap_dbl imap_raw imap_dfr
###   imap_dfc iwalk

### ** Examples

# Note that when using the formula shortcut, the first argument
# is the value, and the second is the position
imap_chr(sample(10), ~ paste0(.y, ": ", .x))
iwalk(mtcars, ~ cat(.y, ": ", median(.x), "\n", sep = ""))



