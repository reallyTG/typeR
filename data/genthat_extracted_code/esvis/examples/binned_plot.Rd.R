library(esvis)


### Name: binned_plot
### Title: Quantile-binned effect size plot
### Aliases: binned_plot

### ** Examples


# Default binned effect size plot
binned_plot(math ~ condition, star)

# Change the reference group to regular sized classrooms
binned_plot(math ~ condition, 
		star,
		ref_group = "reg")

# Change binning to deciles
binned_plot(math ~ condition, 
		star,
		ref_group = "reg",
		qtiles = seq(0, 1, .1))

# Suppress the standard error shading
binned_plot(math ~ condition, 
		star,
		se = FALSE)

# Change to dark theme
binned_plot(math ~ condition, 
		star,
		theme = "dark")



