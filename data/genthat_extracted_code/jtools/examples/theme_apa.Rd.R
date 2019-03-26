library(jtools)


### Name: theme_apa
### Title: Format ggplot2 figures in APA style
### Aliases: theme_apa

### ** Examples

# Create plot with ggplot2
library(ggplot2)
plot <- ggplot(mpg, aes(cty, hwy)) +
  geom_jitter()

# Add APA theme with defaults
plot + theme_apa()





