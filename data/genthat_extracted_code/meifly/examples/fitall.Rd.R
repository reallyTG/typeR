library(meifly)


### Name: fitall
### Title: Fit all combinations of x variables ($2^p$).
### Aliases: fitall
### Keywords: regression

### ** Examples

y <- swiss$Fertility
x <- swiss[, -1]
mods <- fitall(y, x, "lm")



