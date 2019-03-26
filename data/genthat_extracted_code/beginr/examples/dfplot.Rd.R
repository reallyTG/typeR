library(beginr)


### Name: dfplot
### Title: Plot a dataframe, multiple ys against one x
### Aliases: dfplot

### ** Examples

x <- seq(0, 2 * pi, length.out = 100)
y <- data.frame(sin(x), cos(x))
yerror <- data.frame(abs(rnorm(100, sd = 0.3)), abs(rnorm(100, sd = 0.1)))
dfplot(x, y, yerror = yerror)




