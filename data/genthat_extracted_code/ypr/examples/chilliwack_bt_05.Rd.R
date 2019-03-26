library(ypr)


### Name: chilliwack_bt_05
### Title: Chilliwack Lake Bull Trout Populations Parameters
### Aliases: chilliwack_bt_05
### Keywords: datasets

### ** Examples

chilliwack_bt_05
yield <- ypr_tabulate_yield(chilliwack_bt_05, type = "optimal")
yield$pi <- round(yield$pi, 2)
yield <- yield[c("Llo", "Hm", "Rk", "pi")]
yield <- tidyr::spread(yield, Rk, pi)
yield <- yield[order(-yield$Hm),]
yield

## Not run: 
##D ypr_plot_yield(chilliwack_bt_05, plot_values = FALSE) +
##D   ggplot2::facet_grid(Rk~Hm) +
##D   ggplot2::aes(group = Llo, linetype = Llo)
##D  
## End(Not run)



