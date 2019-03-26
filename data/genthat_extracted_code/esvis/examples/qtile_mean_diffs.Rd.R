library(esvis)


### Name: qtile_mean_diffs
### Title: Compute mean differences by various quantiles
### Aliases: qtile_mean_diffs

### ** Examples

qtile_mean_diffs(reading ~ condition, star)

qtile_mean_diffs(reading ~ condition, 
		star, 
		qtiles = seq(0, 1, .2))



