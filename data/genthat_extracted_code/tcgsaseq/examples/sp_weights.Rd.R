library(tcgsaseq)


### Name: sp_weights
### Title: Non parametric local heteroscedasticity weights
### Aliases: sp_weights

### ** Examples

#rm(list = ls())
set.seed(123)

G <- 10000
n <- 12
p <- 2
y <- sapply(1:G, FUN = function(x){rnbinom(n = n, size = 0.07, mu = 200)})

x <- sapply(1:p, FUN = function(x){rnorm(n = n, mean = n, sd = 1)})






