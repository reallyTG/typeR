library(mistr)


### Name: QQplotgg
### Title: Implementation of Quantile-Quantile Plot with ggplot2
### Aliases: QQplotgg QQplotgg.default QQplotgg.dist QQnormgg

### ** Examples

# sample vs sample
QQplotgg(r(normdist(), 10000), r(tdist(df = 4), 10000))

# distribution vs sample
QQplotgg(normdist(), r(tdist(df = 4), 10000))

# distribution vs distribution
QQplotgg(normdist(), tdist(df = 4))



