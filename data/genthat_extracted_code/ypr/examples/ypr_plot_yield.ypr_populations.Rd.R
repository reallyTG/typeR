library(ypr)


### Name: ypr_plot_yield.ypr_populations
### Title: Plot Yield by Exploitation/Capture Probability
### Aliases: ypr_plot_yield.ypr_populations

### ** Examples

## Not run: 
##D ypr_plot_yield(ypr_populations(Rk = c(2.5, 4.6), Llo = c(0, 60)), plot_values = FALSE) +
##D   ggplot2::facet_wrap(~Llo) +
##D   ggplot2::aes_string(group = "Rk", color = "Rk") +
##D   ggplot2::scale_color_manual(values = c("black", "blue"))
##D 
##D ypr_plot_yield(ypr_populations(Rk = c(2.5, 4.6), Llo = c(0, 60))) +
##D   ggplot2::facet_grid(Rk~Llo)
##D  
## End(Not run)



