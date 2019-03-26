library(matsbyname)


### Name: identical_byname
### Title: Compare two matrices "by name" for exact equality
### Aliases: identical_byname

### ** Examples

a <- matrix(1:4, nrow = 2)
b <- matrix(1:4, nrow = 2)
identical_byname(a, b)
identical_byname(a, b + 1e-100)
a <- a %>% setrowtype("Industries") %>% setcoltype("Commodities")
identical_byname(a, b) # FALSE because a has row and column types, but b does not.
b <- b %>% setrowtype("Industries") %>% setcoltype("Commodities")
identical_byname(a, b)
dimnames(a) <- list(c("i1", "i2"), c("c1", "c2"))
dimnames(b) <- list(c("c1", "c2"), c("i1", "i2"))
identical_byname(a, b) # FALSE, because row and column names are not equal
dimnames(b) <- dimnames(a)
identical_byname(a, b)



