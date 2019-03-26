library(ggpubr)


### Name: theme_pubr
### Title: Publication ready theme
### Aliases: theme_pubr theme_pubclean labs_pubr theme_classic2 clean_theme

### ** Examples

p <- ggplot(mtcars, aes(x = wt, y = mpg)) +
   geom_point(aes(color = gear))

# Default plot
p

# Use theme_pubr()
p + theme_pubr()

# Format labels
p + labs_pubr()




