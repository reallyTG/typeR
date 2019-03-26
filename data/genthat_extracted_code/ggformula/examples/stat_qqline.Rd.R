library(ggformula)


### Name: stat_qqline
### Title: A Stat for Adding Reference Lines to QQ-Plots
### Aliases: stat_qqline

### ** Examples

ggplot(data = iris, aes(sample = Sepal.Length)) +
  geom_qq() +
  stat_qqline( alpha = 0.7, color = "red", linetype = "dashed") +
  facet_wrap(~Species)



