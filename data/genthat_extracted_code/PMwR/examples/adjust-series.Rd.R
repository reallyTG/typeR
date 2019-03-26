library(PMwR)


### Name: Adjust-Series
### Title: Adjust Time Series for Dividends and Splits
### Aliases: div_adjust split_adjust

### ** Examples

x <- c(9.777, 10.04, 9.207, 9.406)
div <- 0.7
t <- 3

div_adjust(x, t, div)
div_adjust(x, t, div, FALSE)



