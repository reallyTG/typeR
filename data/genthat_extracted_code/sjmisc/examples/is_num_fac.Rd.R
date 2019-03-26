library(sjmisc)


### Name: is_num_fac
### Title: Check whether a factor has numeric levels only
### Aliases: is_num_fac is_num_chr

### ** Examples

# numeric factor levels
f1 <- factor(c(NA, 1, 3, NA, 2, 4))
is_num_fac(f1)

# not completeley numeric factor levels
f2 <- factor(c(NA, "C", 1, 3, "A", NA, 2, 4))
is_num_fac(f2)

# not completeley numeric factor levels
f3 <- factor(c("Justus", "Bob", "Peter"))
is_num_fac(f3)

is_num_chr(c("a", "1"))
is_num_chr(c("2", "1"))




