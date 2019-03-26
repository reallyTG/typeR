library(cowplot)


### Name: align_plots
### Title: Align multiple plots vertically and/or horizontally
### Aliases: align_plots

### ** Examples

p1 <- ggplot(mpg, aes(manufacturer, hwy)) + stat_summary(fun.y="median", geom = "bar") +
         theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust= 1))
p2 <- ggplot(mpg, aes(manufacturer, displ)) + geom_point(color="red") +
 scale_y_continuous(position = "right") +
 theme(axis.text.x = element_blank())
# manually align and plot on top of each other
aligned_plots <- align_plots(p1, p2, align="hv", axis="tblr")
# Note: In most cases two y-axes should not be used, but this example
# illustrates how one would could accomplish it.
ggdraw(aligned_plots[[1]]) +draw_plot(aligned_plots[[2]])



