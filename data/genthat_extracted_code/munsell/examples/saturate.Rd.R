library(munsell)


### Name: saturate
### Title: Make a munsell colour more saturated
### Aliases: saturate

### ** Examples

saturate("5PB 2/4")
cols <- c("5PB 2/2", "5Y 7/6")
p <- plot_mnsl(c(cols, saturate(cols), saturate(cols, 2)))
p + ggplot2::facet_wrap(~ names, ncol = 2)



