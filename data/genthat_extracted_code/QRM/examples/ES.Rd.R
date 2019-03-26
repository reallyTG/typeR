library(QRM)


### Name: ES
### Title: Expected Shortfall
### Aliases: ES ESnorm ESst
### Keywords: distribution

### ** Examples

p <- c(0.95, 0.99)
s <- 0.2 * 10000 / sqrt(250)
ESnorm(p)
ESst(p, sd = s, df = 4, scale = TRUE)
ESst(p, df = 4)



