library(ggdark)


### Name: dark_mode
### Title: Activate dark mode on a 'ggplot2' theme
### Aliases: dark_mode

### ** Examples

library(ggplot2)

p1 <- ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
  geom_point()

p1  # theme returned by theme_get()
p1 + dark_mode()  # activate dark mode on theme returned by theme_get()

p2 <- ggplot(iris, aes(Sepal.Width, Sepal.Length)) +
  geom_point() +
  facet_wrap(~ Species)

p2 + dark_mode(theme_minimal())  # activate dark mode on another theme

invert_geom_defaults()  # restore geom defaults to their original values



