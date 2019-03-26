library(strapgod)


### Name: bootstrapify
### Title: Create a bootstrapped tibble
### Aliases: bootstrapify

### ** Examples

library(dplyr)
library(broom)

bootstrapify(iris, 5)

iris %>%
  bootstrapify(5) %>%
  summarise(per_strap_mean = mean(Petal.Width))

iris %>%
  group_by(Species) %>%
  bootstrapify(5) %>%
  summarise(per_strap_species_mean = mean(Petal.Width))

iris %>%
  bootstrapify(5) %>%
  do(tidy(lm(Sepal.Width ~ Sepal.Length + Species, data = .)))

# Alternatively, use the newer group_map()
iris %>%
  bootstrapify(5) %>%
  group_map(~tidy(lm(Sepal.Width ~ Sepal.Length + Species, data = .x)))

# Alter the name of the group with `key`
# Materialize them with collect()
straps <- bootstrapify(iris, 5, key = ".straps")
collect(straps)




