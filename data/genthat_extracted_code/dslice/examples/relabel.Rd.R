library(dslice)


### Name: relabel
### Title: Reassigning values of categorical variable
### Aliases: relabel

### ** Examples

n <- 10
x <- c(rep("G1", n), rep("G2", n))
x <- relabel(x)

x <- c(rep(4, n), rep(5, n), rep(NA, n))
x <- relabel(x)



