library(ggpmisc)


### Name: stat_fit_tb
### Title: Model-fit summary or ANOVA
### Aliases: stat_fit_tb

### ** Examples

library(ggplot2)
# t-test example
x <- c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1)
group <- factor(c(rep("A", 4), rep("B", 5)))
my.df <- data.frame(x, group)

ggplot(my.df, aes(group, x)) +
  geom_point() +
  stat_fit_tb(method = "t.test",
              tb.vars = c("italic(t)" = "estimate", "italic(P)" = "p.value"),
              parse = TRUE)




