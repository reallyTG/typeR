library(forcats)


### Name: fct_lump
### Title: Lump together least/most common factor levels into "other"
### Aliases: fct_lump

### ** Examples

x <- factor(rep(LETTERS[1:9], times = c(40, 10, 5, 27, 1, 1, 1, 1, 1)))
x %>% table()
x %>% fct_lump() %>% table()
x %>% fct_lump() %>% fct_inorder() %>% table()

x <- factor(letters[rpois(100, 5)])
x
table(x)
table(fct_lump(x))

# Use positive values to collapse the rarest
fct_lump(x, n = 3)
fct_lump(x, prop = 0.1)

# Use negative values to collapse the most common
fct_lump(x, n = -3)
fct_lump(x, prop = -0.1)

# Use weighted frequencies
w <- c(rep(2, 50), rep(1, 50))
fct_lump(x, n = 5, w = w)

# Use ties.method to control how tied factors are collapsed
fct_lump(x, n = 6)
fct_lump(x, n = 6, ties.method = "max")




