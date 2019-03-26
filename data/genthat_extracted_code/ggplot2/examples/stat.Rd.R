library(ggplot2)


### Name: stat
### Title: Calculated aesthetics
### Aliases: stat

### ** Examples

# Default histogram display
ggplot(mpg, aes(displ)) +
  geom_histogram(aes(y = stat(count)))

# Scale tallest bin to 1
ggplot(mpg, aes(displ)) +
  geom_histogram(aes(y = stat(count / max(count))))



