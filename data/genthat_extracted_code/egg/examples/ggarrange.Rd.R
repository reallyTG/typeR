library(egg)


### Name: ggarrange
### Title: ggarrange
### Aliases: ggarrange

### ** Examples

p1 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point()
p2 <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point() + facet_wrap( ~ cyl, ncol=2, scales = "free") +
  guides(colour="none") +
  theme()
ggarrange(p1, p2, widths = c(2,1), labels = c("a", "b"))



