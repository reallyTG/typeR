library(radiant.multivariate)


### Name: clean_loadings
### Title: Sort and clean loadings
### Aliases: clean_loadings

### ** Examples

result <- full_factor(shopping, "v1:v6", nr_fact = 2)
clean_loadings(result$floadings, fsort = TRUE, cutoff = .5, dec = 2)




