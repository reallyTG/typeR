library(INDperform)


### Name: plot_trend
### Title: Create indicator trend plot
### Aliases: plot_trend

### ** Examples

# Using the example data
trend_tbl <- model_trend_ex
pt <- plot_trend(trend_tbl)
# Show single plots using indicator names or indices
pt[[2]]
pt$Sprat
# Show all plots together
gridExtra::grid.arrange(grobs = pt)



