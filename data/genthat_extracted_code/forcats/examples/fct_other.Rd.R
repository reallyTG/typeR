library(forcats)


### Name: fct_other
### Title: Replace levels with "other"
### Aliases: fct_other

### ** Examples

x <- factor(rep(LETTERS[1:9], times = c(40, 10, 5, 27, 1, 1, 1, 1, 1)))

fct_other(x, keep = c("A", "B"))
fct_other(x, drop = c("A", "B"))



