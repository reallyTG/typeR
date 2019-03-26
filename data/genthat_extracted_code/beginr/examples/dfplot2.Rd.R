library(beginr)


### Name: dfplot2
### Title: Plot a dataframe, one y against multiple xs
### Aliases: dfplot2

### ** Examples

x <- seq(0, 2 * pi, length.out = 100)
y <- data.frame(sin(x), cos(x))
yerror <- data.frame(abs(rnorm(100, sd = 0.3)), abs(rnorm(100, sd = 0.1)))
dfplot2(y, x, xerror = yerror)




