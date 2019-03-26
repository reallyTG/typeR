library(metaviz)


### Name: viz_funnel
### Title: Funnel plot variants for meta-analysis
### Aliases: viz_funnel

### ** Examples

library(metaviz)
# Create a funnel plot using confidence and significance contours
viz_funnel(x = mozart[, c("d", "se")])

# Show a trim-and-fill analysis and Egger's regression line:
viz_funnel(x = mozart[, c("d", "se")], contours = TRUE,
trim_and_fill = TRUE, trim_and_fill_side = "left", egger = TRUE)

# Plot log-odds-ratios on the original OR scale and show additional evidence contours:
viz_funnel(x = exrehab[, c("logor", "logor_se")], sig_contours = FALSE,
addev_contours = TRUE, contours_col = "Greys", xlab = "Odds Ratio",
x_trans_function = exp, x_breaks = log(c(0.125, 0.25, 0.5, 1, 2, 4, 8)))

# Show study subgroups
viz_funnel(x = mozart[, c("d", "se")], group = mozart[, "unpublished"],
group_legend_title = "unpublished?")



