library(huxtable)


### Name: add_colnames
### Title: Add column or row names
### Aliases: add_colnames add_colnames.huxtable add_rownames
###   add_rownames.huxtable

### ** Examples

ht <- huxtable(
        First  = rnorm(5),
        Second = rnorm(5)
      )
add_rownames(ht)
add_colnames(ht)

# Out by 1:
add_rownames(add_colnames(ht))

# Better:
add_colnames(add_rownames(ht))

# Alternatively:
add_colnames(add_rownames(ht, ""))




