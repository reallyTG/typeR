library(ggpmisc)


### Name: stat_fmt_tb
### Title: Select and slice a tibble nested in 'data'
### Aliases: stat_fmt_tb

### ** Examples

library(ggplot2)
my.df <- tibble::tibble(x = c(1, 2),
                    y = c(0, 4),
                    group = c("A", "B"),
                    tbs = list(a = tibble::tibble(X = 1:6, Y = rep(c("x", "y"), 3)),
                               b = tibble::tibble(X = 1:3, Y = "x")))

ggplot(my.df, aes(x, y, label = tbs)) +
  stat_fmt_tb() +
  expand_limits(x = c(0,3), y = c(-2, 6))

ggplot(my.df, aes(x, y, label = tbs)) +
  stat_fmt_tb(tb.vars = c(value = "X", group = "Y"),
               tb.rows = 1:3) +
  expand_limits(x = c(0,3), y = c(-2, 6))




