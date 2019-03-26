library(childhoodmortality)


### Name: childhoodmortality
### Title: Calculates childhood mortality
### Aliases: childhoodmortality

### ** Examples

data("model_ipums_dhs_dataset")
underfive_mortality_rates <- childhoodmortality(
 model_ipums_dhs_dataset,
 grouping ="wealthq",
 rate_type = "underfive"
)




