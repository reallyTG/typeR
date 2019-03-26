library(bayesmix)


### Name: fish
### Title: Fish length data
### Aliases: fish
### Keywords: datasets

### ** Examples

data("fish", package = "bayesmix")
ss <- seq(-3, 13, by = 0.01)
hist(fish[[1]], 20, freq = FALSE, main = "Fish data")
lines(ss, dnorm(ss, mean(fish[[1]]), sd(fish[[1]])), col = "red")



