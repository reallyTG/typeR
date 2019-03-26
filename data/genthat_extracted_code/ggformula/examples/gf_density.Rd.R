library(ggformula)


### Name: gf_density
### Title: Formula interface to stat_density()
### Aliases: gf_density gf_dens

### ** Examples

gf_dens()
gf_density( ~ Sepal.Length,  fill = ~ Species, data = iris)
gf_dens( ~ Sepal.Length, color = ~ Species, data = iris)
gf_freqpoly( ~ Sepal.Length, color = ~ Species, data = iris, bins = 15)
# Chaining in the data
iris %>% gf_dens( ~ Sepal.Length, color = ~ Species)



