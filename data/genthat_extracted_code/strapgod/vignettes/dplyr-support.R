## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, warning=FALSE---------------------------------
set.seed(123)
library(strapgod)
library(dplyr)

## ------------------------------------------------------------------------
x <- bootstrapify(iris, 10)

# Not materialized
x

# Materialized
collect(x)

## ------------------------------------------------------------------------
collect(x, id = ".id")

## ------------------------------------------------------------------------
collect(x, original_id = ".original_id")

## ------------------------------------------------------------------------
summarise(x, mean_length = mean(Sepal.Length))

## ------------------------------------------------------------------------
# Non-bootstrapped
iris %>%
  group_by(Species) %>%
  summarise(
    mean_length_across_species = mean(Sepal.Length)
  )

# Bootstrapped
iris %>%
  group_by(Species) %>%
  bootstrapify(5) %>%
  summarise(
    mean_length_across_species = mean(Sepal.Length)
  )

## ------------------------------------------------------------------------
do(x, model = lm(Sepal.Length ~ Sepal.Width, data = .))

## ------------------------------------------------------------------------
group_nest(x)

## ------------------------------------------------------------------------
group_nest(x, keep = TRUE)$data[[1]]

## ------------------------------------------------------------------------
group_split(x) %>% head(n = 3)

## ------------------------------------------------------------------------
group_split(x, keep = FALSE) %>% head(n = 3)

## ------------------------------------------------------------------------
# Just show the first 2 rows of each bootstrap
group_map(x, ~head(.x, n = 2))

# As you iterate though each group, you have access to that
# group's metadata through `.y` if you need it.
group_map_group_data <- group_map(x, ~tibble(.g = list(.y)))

group_map_group_data

group_map_group_data$.g[[1]]

## ------------------------------------------------------------------------
iris %>%
  group_by(Species) %>%
  group_map(~ broom::tidy(lm(Petal.Length ~ Sepal.Length, data = .x)))

## ------------------------------------------------------------------------
ungroup(x)

## ------------------------------------------------------------------------
as_tibble(x)

## ------------------------------------------------------------------------
mutate(x, mean = mean(Sepal.Length))

