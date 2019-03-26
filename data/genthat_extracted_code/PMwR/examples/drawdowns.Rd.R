library(PMwR)


### Name: drawdowns
### Title: Compute Drawdowns
### Aliases: drawdowns drawdowns.zoo drawdowns.default

### ** Examples


x <- c(100, 98)
drawdowns(x)

x <- c(100, 98, 102, 99)
dd <- drawdowns(x)
dd[order(dd$max, decreasing = TRUE), ]



