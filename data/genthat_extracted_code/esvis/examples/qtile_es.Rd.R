library(esvis)


### Name: qtile_es
### Title: Compute effect sizes by quantile bins
### Aliases: qtile_es

### ** Examples


# Compute effect sizes (Cohen's d) by default quantiles
qtile_es(reading ~ condition, star)

# Compute Cohen's d by quintile
qtile_es(reading ~ condition, 
		star, 
		qtiles = seq(0, 1, .2))

# Report effect sizes only relative to regular-sized classrooms
qtile_es(reading ~ condition, 
		star, 
		ref_group = "reg",
		qtiles = seq(0, 1, .2))



