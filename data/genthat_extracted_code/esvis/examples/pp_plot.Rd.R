library(esvis)


### Name: pp_plot
### Title: Produces the paired probability plot for two groups
### Aliases: pp_plot

### ** Examples

# Prouduce default Probability-Probability plot with two groups
dev.off()
pp_plot(math ~ freelunch, star)

# Suppress shading and effect-size annotation
pp_plot(math ~ freelunch, 
		star, 
		shade = FALSE, 
		text = FALSE)

# Change color of shading & line, line width, and title
pp_plot(math ~ freelunch, 
		star, 
		shade_col = grDevices::rgb(0.1, 0.8, 0.2, 0.5), 
		col = "purple", lwd = 5, 
		main = "Probability-Probability Plot")

# Change to dark theme
pp_plot(math ~ freelunch, star, theme = "dark")

# Produce default PP plot w/multiple groups
pp_plot(mean ~ grade, seda)

# Change reference group to third grade
pp_plot(mean ~ grade, 
		seda, 
		ref_group = "3")




