library(trend)


### Name: partial.cor.trend.test
### Title: Partial Correlation Trend Test
### Aliases: partial.cor.trend.test
### Keywords: multivariate nonparametric ts

### ** Examples

data(maxau)
a <- tsp(maxau) ; tt <- a[1]:a[2]
s <- maxau[,"s"] ; Q <- maxau[,"Q"]
maxau.df <- data.frame(Year = tt, s =s, Q = Q)
plot(maxau.df)

partial.cor.trend.test(s,Q, method="pearson")
partial.cor.trend.test(s,Q, method="spearman")




