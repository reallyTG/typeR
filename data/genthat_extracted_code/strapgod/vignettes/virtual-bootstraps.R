## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE, warning=FALSE---------------------------------
set.seed(123)
library(strapgod)
library(dplyr)
iris <- as_tibble(iris)

## ------------------------------------------------------------------------
iris_boot <- bootstrapify(iris, times = 10)

nrow(iris)
nrow(iris_boot)

iris_boot

## ------------------------------------------------------------------------
iris_samp <- samplify(iris, times = 10, size = 20, replace = FALSE)

iris_samp

## ------------------------------------------------------------------------
# without the bootstrap
iris %>%
  summarise(
    mean_length = mean(Sepal.Length)
  )

# with the bootstrap
iris %>%
  bootstrapify(10) %>%
  summarise(
    mean_length = mean(Sepal.Length)
  )

## ------------------------------------------------------------------------
iris %>%
  bootstrapify(10) %>%
  summarise(mean_length = mean(Sepal.Length)) %>%
  summarise(
    bootstrapped_mean = mean(mean_length),
    bootstrapped_sd   = sd(mean_length)
  )

## ------------------------------------------------------------------------
iris_group_strap <- iris %>%
  group_by(Species) %>%
  bootstrapify(100) 

iris_group_strap

## ------------------------------------------------------------------------
iris_group_strap %>%
  summarise(mean_length = mean(Sepal.Length)) %>%
  summarise(
    bootstrapped_mean = mean(mean_length),
    bootstrapped_sd   = sd(mean_length)
  )

## ------------------------------------------------------------------------
group_data(iris_boot)

## ------------------------------------------------------------------------
group_data(iris_boot)$.rows[[1]]

## ------------------------------------------------------------------------
collect(iris_boot)

