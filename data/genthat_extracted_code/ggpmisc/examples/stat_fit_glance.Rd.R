library(ggpmisc)


### Name: stat_fit_glance
### Title: One row summary data frame for a fitted model
### Aliases: stat_fit_glance

### ** Examples

library(ggplot2)
# Correlation example
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
y <- c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8)
my.df <- data.frame(x, y)
# estimated correlation is in column "estimate"!
broom::glance(cor.test(x, y))
ggplot(my.df, aes(x, y)) +
  geom_point() +
  stat_fit_glance(geom = "text",
                  method = "cor.test",
                  method.args = list(x = x, y = y, method = "spearman"),
                  aes(label = sprintf('r[s]~"="~%.2f~~italic(P)~"="~%.2f',
                      stat(estimate), stat(p.value))),
                  parse = TRUE)




