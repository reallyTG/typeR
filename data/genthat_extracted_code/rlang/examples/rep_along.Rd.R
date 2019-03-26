library(rlang)


### Name: rep_along
### Title: Create vectors matching the length of a given vector
### Aliases: rep_along rep_named

### ** Examples

x <- 0:5
rep_along(x, 1:2)
rep_along(x, 1)

# Create fresh vectors by repeating missing values:
rep_along(x, na_int)
rep_along(x, na_chr)

# rep_named() repeats a value along a names vectors
rep_named(c("foo", "bar"), list(letters))



