library(plm)


### Name: purtest
### Title: Unit root tests for panel data
### Aliases: purtest print.purtest summary.purtest print.summary.purtest
### Keywords: htest

### ** Examples

data("Grunfeld", package = "plm")
y <- data.frame(split(Grunfeld$inv, Grunfeld$firm))

purtest(y, pmax = 4, exo = "intercept", test = "madwu")

## same via formula interface
purtest(inv ~ 1, data = Grunfeld, index = c("firm", "year"), pmax = 4, test = "madwu")



