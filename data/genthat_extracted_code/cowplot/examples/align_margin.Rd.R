library(cowplot)


### Name: align_margin
### Title: Align multiple plots along a specified margin
### Aliases: align_margin

### ** Examples

# Example for how to utilize, though align_plots() does this internally and automatically
p1 <- qplot(1:10, 1:10)
p2 <- qplot(1:10, (1:10)^2)
p3 <- qplot(1:10, (1:10)^3)
plots <- list(p1, p2, p3)
grobs <- lapply(plots, ggplot2::ggplotGrob)
plot_widths <- lapply(grobs, function(x){x$widths})
# Aligning the Left margins of all plots
aligned_widths <- align_margin(plot_widths, "first")
# Aligning the right margins of all plots as well
aligned_widths <- align_margin(plot_widths, "last")
# Setting the dimensions of plots to the aligned dimensions
for(i in 1:3){
   plots[[i]]$widths <- aligned_widths[[i]]
}



