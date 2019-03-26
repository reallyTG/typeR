library(dplyr)


### Name: group_map
### Title: Apply a function to each group
### Aliases: group_map group_walk

### ** Examples

mtcars %>%
  group_by(cyl) %>%
  group_map(~ head(.x, 2L))

if (requireNamespace("broom", quietly = TRUE)) {
  iris %>%
    group_by(Species) %>%
    group_map(~ broom::tidy(lm(Petal.Length ~ Sepal.Length, data = .x)))
}

iris %>%
  group_by(Species) %>%
  group_map(~ {
     quantile(.x$Petal.Length, probs = c(0.25, 0.5, 0.75)) %>%
     tibble::enframe(name = "prob", value = "quantile")
  })

iris %>%
  group_by(Species) %>%
  group_map(~ {
    .x %>%
      purrr::map_dfc(fivenum) %>%
      mutate(nms = c("min", "Q1", "median", "Q3", "max"))
  })

# group_walk() is for side effects
dir.create(temp <- tempfile())
iris %>%
  group_by(Species) %>%
  group_walk(~ write.csv(.x, file = file.path(temp, paste0(.y$Species, ".csv"))))
list.files(temp, pattern = "csv$")
unlink(temp, recursive = TRUE)

# group_map() and ungrouped data frames
mtcars %>%
  group_map(~ head(.x, 2L))




