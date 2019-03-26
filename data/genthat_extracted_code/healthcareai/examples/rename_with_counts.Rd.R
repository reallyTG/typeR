library(healthcareai)


### Name: rename_with_counts
### Title: Adds the category count to each category name in a given
###   variable column
### Aliases: rename_with_counts

### ** Examples

rename_with_counts(pima_diabetes, weight_class)

# Below is an example of how `rename_with_counts` can be helpful when
# creating plots and tables. This graph shows the outcomes of different
# weight classes in `pima_diabetes`. With the added information from
# `rename_with_counts`, we can see how common each category is.
library(ggplot2)
rename_with_counts(pima_diabetes, weight_class) %>%
  ggplot(aes(x = reorder(weight_class, diabetes, function(x) mean(x == "Y")),
             fill = diabetes)) +
  geom_bar(position = "fill") +
  coord_flip()




