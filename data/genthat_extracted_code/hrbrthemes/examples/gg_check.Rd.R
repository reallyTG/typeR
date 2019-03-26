library(hrbrthemes)


### Name: gg_check
### Title: Spell check ggplot2 plot labels
### Aliases: gg_check

### ** Examples

library(ggplot2)

df <- data.frame(x=c(20, 25, 30), y=c(4, 4, 4), txt=c("One", "Two", "Three"))

# not piping
ggplot(mtcars, aes(mpg, wt)) +
  geom_point() +
  labs(x="This is some txt", y="This is more text",
       title="Thisy is a titlle",
       subtitle="This is a subtitley",
       caption="This is a captien") -> gg

gg_check(gg)



