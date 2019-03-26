library(strapgod)


### Name: samplify
### Title: Created a resampled tibble
### Aliases: samplify

### ** Examples

library(dplyr)
library(broom)

samplify(iris, times = 3, size = 20)

iris %>%
  samplify(times = 3, size = 20) %>%
  summarise(per_strap_mean = mean(Petal.Width))

iris %>%
  group_by(Species) %>%
  samplify(times = 3, size = 20) %>%
  summarise(per_strap_species_mean = mean(Petal.Width))

# Alter the name of the group with `key`
# Materialize them with collect()
samps <- samplify(iris, times = 3, size = 5, key = ".samps")
collect(samps)

collect(samps, id = ".id", original_id = ".orig_id")

#----------------------------------------------------------------------------

# Be careful not to specify a `size` larger
# than one of your groups! This will throw an error.

iris_group_sizes_of_50_and_5 <- iris[1:55,] %>%
  group_by(Species) %>%
  group_trim()

count(iris_group_sizes_of_50_and_5, Species)

# size = 10 > min_group_size = 5
## Not run: 
##D iris_group_sizes_of_50_and_5 %>%
##D   samplify(times = 2, size = 10)
## End(Not run)

# Instead, pass a vector of sizes to `samplify()` if this
# structure is absolutely required for your use case.

# size of 10 for the first group
# size of 5 for the second group
# total number of rows is 10 * 2 + 5 * 2 = 30
iris_group_sizes_of_50_and_5 %>%
  samplify(times = 2, size = c(10, 5)) %>%
  collect()




