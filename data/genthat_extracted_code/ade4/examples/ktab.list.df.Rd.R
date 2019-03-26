library(ade4)


### Name: ktab.list.df
### Title: Creating a K-tables from a list of data frames.
### Aliases: ktab.list.df
### Keywords: multivariate

### ** Examples

data(jv73)
l0 <- split(jv73$morpho, jv73$fac.riv)
l0 <- lapply(l0, function(x) data.frame(t(scalewt(x))))
kta <- ktab.list.df(l0)
kplot(sepan(kta[c(2, 5, 7, 10)]), perm = TRUE)



