library(fuzzyreg)


### Name: plot.fuzzylm
### Title: Plot Fuzzy Linear Regression
### Aliases: plot.fuzzylm
### Keywords: fuzzy

### ** Examples

data(fuzzydat)
f = fuzzylm(y ~ x, fuzzydat$lee)
plot(f)
plot(f, res = 20, col.fuzzy = "red")



