library(mistr)


### Name: QQplot
### Title: Quantile-Quantile Plot
### Aliases: QQplot QQplot.default QQplot.dist QQnorm

### ** Examples

# sample vs sample
QQplot(r(normdist(), 10000), r(tdist(df = 4), 10000))

# distribution vs sample
QQplot(normdist(), r(tdist(df = 4), 10000))

# distribution vs distribution
QQplot(normdist(), tdist(df = 4))



