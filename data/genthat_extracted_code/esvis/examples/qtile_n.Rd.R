library(esvis)


### Name: qtile_n
### Title: Compute sample size for each quantile bin for each group
### Aliases: qtile_n

### ** Examples

qtile_n(reading ~ condition, star)

qtile_n(reading ~ condition, 
		star, 
		qtiles = seq(0, 1, .2))



