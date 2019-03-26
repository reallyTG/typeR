library(munsell)


### Name: lighter
### Title: Make a munsell colour lighter
### Aliases: lighter

### ** Examples

lighter("5PB 2/4")
cols <- c("5PB 2/4", "5Y 6/8")
p <- plot_mnsl(c(cols, lighter(cols), lighter(cols, 2)))
p + ggplot2::facet_wrap(~ names, ncol = 2)
# lighter and darker are usually reversible
lighter(darker("5PB 2/4"))
# unless you try to pass though white or black
lighter(darker("5PB 1/4"))



