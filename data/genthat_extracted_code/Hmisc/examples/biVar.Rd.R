library(Hmisc)


### Name: biVar
### Title: Bivariate Summaries Computed Separately by a Series of
###   Predictors
### Aliases: biVar print.biVar plot.biVar spearman2 spearman2.default
###   spearman2.formula spearman spearman.test chiSquare
### Keywords: nonparametric htest category

### ** Examples

x <- c(-2, -1, 0, 1, 2)
y <- c(4,   1, 0, 1, 4)
z <- c(1,   2, 3, 4, NA)
v <- c(1,   2, 3, 4, 5)

spearman2(x, y)
plot(spearman2(z ~ x + y + v, p=2))

f <- chiSquare(z ~ x + y + v)
f



