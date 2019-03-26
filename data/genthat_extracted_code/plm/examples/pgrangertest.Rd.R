library(plm)


### Name: pgrangertest
### Title: Panel Granger Causality Test (Dumitrescu/Hurlin (2012))
### Aliases: pgrangertest
### Keywords: htest

### ** Examples

## not meaningful, just to demonstrate usage
## H0: 'value' Granger causes 'inv' for all invididuals

data("Grunfeld", package = "plm")
pgrangertest(inv ~ value, data = Grunfeld)
pgrangertest(inv ~ value, data = Grunfeld, order = 2L)
pgrangertest(inv ~ value, data = Grunfeld, order = 2L, test = "Zbar")

# varying lag order (last individual lag order 3, others lag order 2)
pgrangertest(inv ~ value, data = Grunfeld, order = c(rep(2L, 9), 3L))




