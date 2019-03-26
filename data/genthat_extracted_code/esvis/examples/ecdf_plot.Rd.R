library(esvis)


### Name: ecdf_plot
### Title: Empirical Cumulative Distribution Plot
### Aliases: ecdf_plot

### ** Examples

# Produce base empirical cummulative distribution plot
ecdf_plot(mean ~ grade, seda)

# Shade distributions to the right of three cut scores
ecdf_plot(mean ~ grade, 
		seda,
		ref_cut = c(225, 245, 265))

# Add horizontal reference lines
ecdf_plot(mean ~ grade, 
		seda,
		ref_cut = c(225, 245, 265),
		ref_hor = TRUE)

# Apply dark theme
ecdf_plot(mean ~ grade, 
		seda,
		ref_cut = c(225, 245, 265),
		theme = "dark")



