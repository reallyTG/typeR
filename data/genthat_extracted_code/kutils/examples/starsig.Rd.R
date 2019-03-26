library(kutils)


### Name: starsig
### Title: How many stars would we need for this p value?
### Aliases: starsig

### ** Examples

starsig(0.06)
starsig(0.021)
starsig(0.001)
alpha.ex <- c(0.10, 0.05, 0.01, 0.001)
symb.ex <- c("+", "*", "**", ":)!")
starsig(0.07, alpha = alpha.ex, symbols = symb.ex)
starsig(0.04, alpha = alpha.ex, symbols = symb.ex)
starsig(0.009, alpha = alpha.ex, symbols = symb.ex)
starsig(0.0009, alpha = alpha.ex, symbols = symb.ex)




