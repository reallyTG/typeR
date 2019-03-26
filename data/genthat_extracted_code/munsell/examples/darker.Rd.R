library(munsell)


### Name: darker
### Title: Make a munsell colour darker
### Aliases: darker

### ** Examples

darker("5PB 3/4")
cols <- c("5PB 3/4", "5Y 7/8")
p <- plot_mnsl(c(cols, darker(cols), darker(cols, 2)))
p + ggplot2::facet_wrap(~ names, ncol = 2)



