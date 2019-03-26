library(ggdark)


### Name: ggdarktheme
### Title: Complete dark themes
### Aliases: dark_theme_bw dark_theme_classic dark_theme_gray
###   dark_theme_grey dark_theme_minimal dark_theme_light dark_theme_dark
###   dark_theme_void dark_theme_test dark_theme_linedraw

### ** Examples

library(ggplot2)

mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V-shaped", "Straight"))
  am <- factor(am, labels = c("Automatic", "Manual"))
  cyl  <- factor(cyl)
  gear <- factor(gear)
})

p1 <- ggplot(mtcars2) +
  geom_point(aes(x = wt, y = mpg, colour = gear)) +
  labs(title = "Fuel economy declines as weight increases",
       subtitle = "(1973-74)",
       caption = "Data from the 1974 Motor Trend US magazine.",
       tag = "Figure 1",
       x = "Weight (1000 lbs)",
       y = "Fuel economy (mpg)",
       colour = "Gears")

p1 + dark_theme_gray()
p1 + dark_theme_bw()
p1 + dark_theme_linedraw()
p1 + dark_theme_light()  # quite dark
p1 + dark_theme_dark()   # quite light
p1 + dark_theme_minimal()
p1 + dark_theme_classic()
p1 + dark_theme_void()

# Theme examples with panels
## No test: 
p2 <- p1 + facet_grid(vs ~ am)

p2 + dark_theme_gray()
p2 + dark_theme_bw()
p2 + dark_theme_linedraw()
p2 + dark_theme_light()  # quite dark
p2 + dark_theme_dark()   # quite light
p2 + dark_theme_minimal()
p2 + dark_theme_classic()
p2 + dark_theme_void()
## End(No test)



