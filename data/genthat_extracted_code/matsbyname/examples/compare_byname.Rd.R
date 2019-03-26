library(matsbyname)


### Name: compare_byname
### Title: Compare matrix entries to a value
### Aliases: compare_byname

### ** Examples

m <- matrix(c(0, 1, 2, 3, 4, 0), nrow = 3, ncol = 2)
compare_byname(m, "<", 3)
compare_byname(list(m,m), "<", 3)



