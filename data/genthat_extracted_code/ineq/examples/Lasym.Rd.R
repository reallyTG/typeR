library(ineq)


### Name: Lasym
### Title: Lorenz Asymmetry Coefficient
### Aliases: Lasym
### Keywords: misc

### ** Examples

## Examples from Damgaard & Weiner (2000)

## Figure 2
x <- rep(c(50/9, 50), c(9, 1))
y <- rep(c(2, 18), c(5, 5))
plot(table(x))
plot(table(y))

## statistics
mean(x)
mean(y)
Gini(x, corr = TRUE)
Gini(y, corr = TRUE)
Lasym(x)
Lasym(y)

## Figure 3
plot(Lc(x))
lines(Lc(y), col = "slategray")
abline(1, -1, lty = 2)




