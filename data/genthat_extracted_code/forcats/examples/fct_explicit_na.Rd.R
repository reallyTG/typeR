library(forcats)


### Name: fct_explicit_na
### Title: Make missing values explicit
### Aliases: fct_explicit_na

### ** Examples

f1 <- factor(c("a", "a", NA, NA, "a", "b", NA, "c", "a", "c", "b"))
table(f1)

f2 <- fct_explicit_na(f1)
table(f2)



